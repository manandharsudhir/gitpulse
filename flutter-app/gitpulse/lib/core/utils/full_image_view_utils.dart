import 'dart:io';

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';

class FullImagePreviewUitls {
  static viewFullImage(
      {required BuildContext context,
      required String imageUrl,
      bool isFile = false,
      VoidCallback? onDismissed}) {
    showImageViewer(
        context,
        isFile
            ? Image.file(File(imageUrl)).image
            : imageUrl.isEmpty
                ? Image.asset("assets/images/logo.png").image
                : Image.network(
                    imageUrl,
                    errorBuilder: (context, child, _) {
                      return Image.asset("assets/images/logo.png");
                    },
                  ).image,
        onViewerDismissed: onDismissed);
  }
}
