import 'dart:io';
// import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gitpulse/core/widgets/toast/toast.dart';
import 'package:permission_handler/permission_handler.dart';

final selectedImage = StateProvider<File?>((ref) {
  File? file;
  return file;
});
final selectedMultiImageProvider = StateProvider<List<File>>((ref) => []);

final encodedImage = StateProvider<String>((ref) {
  return '';
});

class GetImageServices extends ChangeNotifier {
  File? image;
  // final _picker = ImagePicker();
  bool isLoading = false;

  GetImageServices() {
    clearImage();
  }
  List<File> pickedImage = [];

  clearImage() {
    pickedImage = [];
    notifyListeners();
    return pickedImage;
  }

  removeImage(File item) {
    pickedImage.remove(item);
    notifyListeners();
    return pickedImage;
  }

  Future<void> getImage(CustomImageSource source) async {
    isLoading = true;
    notifyListeners();
    if (Platform.isIOS) {
      bool permissionGranted = await checkAndRequestPermission(source);
      if (!permissionGranted) {
        showErrorToast("Permission denied");
        return;
      }
    }
    try {
      switch (source) {
        case CustomImageSource.gallery:
          final List<XFile> pickedMultiImage =
              await ImagePicker().pickMultiImage(
            imageQuality: 40,
          );
          if (pickedMultiImage.isNotEmpty) {
            for (var element in pickedMultiImage) {
              pickedImage.add(File(element.path));
            }

            notifyListeners();
          }

          break;
        case CustomImageSource.camera:
          if (Platform.isAndroid) {
            bool permissionGranted = await checkAndRequestPermission(source);
            if (!permissionGranted) {
              showErrorToast("Permission denied");
              return;
            }
          }
          final XFile? pickedSingleImage = await ImagePicker().pickImage(
            source: ImageSource.camera,
            imageQuality: 40,
            preferredCameraDevice: CameraDevice.rear,
          );

          if (pickedSingleImage != null) {
            pickedImage.add(File(pickedSingleImage.path));
            notifyListeners();
          }

          break;
        // case CustomImageSource.file:
        //   var pickedFile =
        //       await FilePicker.platform.pickFiles(allowMultiple: true);

        //   if (pickedFile != null) {
        //     for (var element in pickedFile.files) {
        //       pickedImage.add(File(element.path!));
        //     }
        //     notifyListeners();
        //   }

        //   break;
        case CustomImageSource.singlePhoto:
          final XFile? pickedSingleImage = await ImagePicker().pickImage(
            imageQuality: 40,
            source: ImageSource.gallery,
          );
          if (pickedSingleImage != null) {
            pickedImage.add(File(pickedSingleImage.path));

            notifyListeners();
          }

          break;
        default:
      }
    } on PlatformException catch (e) {
      if ((e.message ?? "").toLowerCase().contains("access")) {
        showErrorToast("Permission denied");
      } else {
        showErrorToast("Unable to pick image");
      }
    } catch (e) {
      showErrorToast("Unable to pick image");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> checkAndRequestPermission(CustomImageSource source) async {
    Permission permission;

    switch (source) {
      case CustomImageSource.gallery:
      case CustomImageSource.singlePhoto:
      case CustomImageSource.file:
        permission = Platform.isIOS ? Permission.photos : Permission.storage;
        break;
      case CustomImageSource.camera:
        permission = Permission.camera;
        break;
    }

    if (await permission.isGranted) {
      return true;
    }

    // Request permission if not granted
    final result = await permission.request();

    if (result.isPermanentlyDenied || result.isDenied) {
      return false;
    }

    return result.isGranted;
  }
}

final imageserviceProvider =
    ChangeNotifierProvider.autoDispose<GetImageServices>((ref) {
  return GetImageServices();
});

enum CustomImageSource { gallery, camera, singlePhoto, file }
