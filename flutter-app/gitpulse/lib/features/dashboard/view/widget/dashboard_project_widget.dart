import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/widgets/facepile_widget.dart';

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
                Expanded(
                    child: Text(
                  "Project Name",
                  style: AppTextStyle.bodyb2Bold,
                )),
                Expanded(
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
            "Work Title",
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
          Expanded(child: Text("Title")),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Text("Design System update")),
                // IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                // IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
