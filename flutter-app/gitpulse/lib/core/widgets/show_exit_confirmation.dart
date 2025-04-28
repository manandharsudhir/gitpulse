import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gitpulse/core/widgets/button/button_type.dart';

import '../configs/spacing_size.dart';
import '../configs/style/colors.dart';
import 'button/custom_button.dart';

Future<bool> doubleTapExitButton(BuildContext context) async {
  // DateTime now = DateTime.now();
  // if (now.difference(GlobalVariables.currentBackPressTime) <
  //     const Duration(milliseconds: 700)) {
  // }
  return await showExitConformationDialog(context);

  // EasyLoading.showToast(
  //   "Please Press back button twice to exit",
  //   maskType: EasyLoadingMaskType.clear,
  //   duration: const Duration(milliseconds: 750),
  //   toastPosition: EasyLoadingToastPosition.bottom,
  // );
  // GlobalVariables.currentBackPressTime = now;
  // return Future.value(false);
}

/// confirms user if they want to exit the app
Future<bool> showExitConformationDialog(BuildContext context) async {
  bool status = false;
  await showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      scrollable: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(22.0)),
      ),
      title: Center(
        child: Container(
          width: 10,
          color: const Color.fromARGB(255, 238, 230, 229),
          child: const Icon(
            Icons.exit_to_app,
            color: Colors.red,
          ),
        ),
      ),
      content: const Center(
        child: Text(
          "Are You sure want to exit this app?",
          // context.translator.areYouSureWantToExitThisApp,
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: CustomButton(
                    text: "Cancel",
                    buttonVariant: ButtonVariant.primary,
                    onPressed: () {
                      Navigator.of(context).pop();
                      status = false;
                    })),
            Spacing.sizedBoxW_16(),
            Expanded(
                child: CustomButton(
                    text: "Exit",
                    bgColor: Palette.errorDark,
                    onPressed: () {
                      SystemNavigator.pop();
                      status = true;
                    })),
          ],
        ),
      ],
      contentPadding: const EdgeInsets.all(18),
    ),
  );
  return status;
}
