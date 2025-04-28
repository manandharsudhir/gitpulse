import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/widgets/facepile_widget.dart';
import 'package:gitpulse/features/dashboard/view/widget/delete_form_widget.dart';
import 'package:gitpulse/features/dashboard/view/widget/edit_form_widget.dart';

class DashboardProjectWidget extends StatelessWidget {
  const DashboardProjectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Palette.defaultStroke,
          )),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 13),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Palette.defaultStroke,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "Project Name",
                  style: AppTextStyle.bodyb2Bold,
                )),
                Expanded(child: Text("Users")),
                // Expanded(
                //     child: Text(
                //   "Project Name",
                //   style: AppTextStyle.bodyb2Bold,
                // )),
                Expanded(
                    flex: 2,
                    child: Text(
                      "About",
                      style: AppTextStyle.bodyb2Bold,
                    )),
              ],
            ),
          ),
          ...List.generate(5, (index) => DashboardProjectLogItemWidget()),
        ],
      ),
    );
  }
}

class DashboardProjectLogItemWidget extends StatelessWidget {
  const DashboardProjectLogItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 13),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Palette.defaultStroke,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
              child: Text(
            "Project 1",
            style: AppTextStyle.bodyb2Bold,
          )),
          Expanded(
            child: FacePile(
              images: [
                CircleAvatar(
                  radius: 10,
                ),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                ),
                CircleAvatar(
                  radius: 10,
                ),
              ],
              radius: 18,
              space: 20,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(child: Text("Design System update")),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    padding: EdgeInsets.all(40),
                                    width: 597,
                                    height: 270,
                                    child: DeleteFormWidget()),
                              ));
                    },
                    icon: Icon(Icons.delete)),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    padding: EdgeInsets.all(50),
                                    width: 797,
                                    height: 470,
                                    child: EditFormWidget()),
                              ));
                    },
                    icon: Icon(Icons.edit)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
