import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/widgets/image_builder/assets_image_builder.dart';
import 'package:gitpulse/core/widgets/image_builder/image_builder.dart';
import 'package:gitpulse/features/dashboard/view/widget/add_form_widget.dart';
import 'package:gitpulse/features/dashboard/view/widget/edit_form_widget.dart';

class DashboardHeaderWidget extends StatelessWidget {
  const DashboardHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Dashboard",
          style: AppTextStyle.headingh3,
        ),
        Spacer(),
        Row(
          spacing: 17,
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => Dialog(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(50),
                              width: 797,
                              height: 470,
                              child: AddFormWidget()),
                        ));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(
                    color: Palette.lineDark,
                  ),
                ),
                child: Row(
                  spacing: 4,
                  children: [
                    Text(
                      "Add log",
                    ),
                    AssetImageBuilder(
                      url: Assets.icons.png.icPlus.path,
                      width: 22,
                      height: 22,
                    )
                  ],
                ),
              ),
            ),
            ImageBuilder(
              url: FirebaseAuth.instance.currentUser?.photoURL ?? "",
              shape: BoxShape.circle,
            ),
          ],
        ),
      ],
    );
  }
}
