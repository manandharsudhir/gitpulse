import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';
import 'package:toastification/toastification.dart';

Future showSuccessToast(String message, {Color? color}) async {
  toastification.show(
      title: Text(
        message,
        maxLines: 2,
        style: AppTextStyle.bodyb1.copyWith(
          color: Palette.successDark,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Palette.successDark),
      backgroundColor: color ?? Palette.successLight,
      icon: SvgImageBuilder(svgPath: Assets.icons.tickCircle),
      showProgressBar: false,
      alignment: Alignment.bottomCenter,
      closeOnClick: false,
      // applyBlurEffect: true,
      autoCloseDuration: Duration(seconds: 2),
      dragToClose: true,
      type: ToastificationType.success,
      // animationDuration: Duration(seconds: 3),
      boxShadow: [
        BoxShadow(
          offset: Offset(15, 15),
          blurRadius: 45,
          color: Color.fromRGBO(0, 0, 0, 0.4),
        )
      ]);
}

Future showErrorToast(String message, {Color? color}) async {
  // await Fluttertoast.cancel();
  toastification.show(
      title: Text(
        message,
        maxLines: 2,
        style: AppTextStyle.bodyb1.copyWith(
          color: Palette.errorDark,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Palette.errorDark),
      backgroundColor: color ?? Palette.errorLight,
      icon: SvgImageBuilder(svgPath: Assets.icons.error),
      showProgressBar: false,
      alignment: Alignment.bottomCenter,
      closeOnClick: false,
      // applyBlurEffect: true,
      autoCloseDuration: Duration(seconds: 2),
      dragToClose: true,

      // animationDuration: Duration(seconds: 3),
      boxShadow: [
        BoxShadow(
          offset: Offset(15, 15),
          blurRadius: 45,
          color: Color.fromRGBO(0, 0, 0, 0.4),
        )
      ]);
  // ShToast.showNotification(
  //     msg: message,
  //     toastLength: Toast.LENGTH_LONG,
  //     gravity: ToastGravity.BOTTOM,
  //     backgroundColor: color ?? Colors.red,
  //     textColor: Colors.white,
  //     fontSize: 16.0);
}
