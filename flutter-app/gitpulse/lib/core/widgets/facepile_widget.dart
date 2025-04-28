library;

import 'package:flutter/material.dart';

/// [FacePile] displays a stacked list of users.
/// Each circle represents a person and contains their image.
/// This widget is usually used when sharing who has access to a specific
/// view or file, or when assigning tasks to someone in a workflow.
class FacePile extends StatelessWidget {
  const FacePile({
    super.key,
    required this.images,
    required this.radius,
    required this.space,
    this.child,
    this.backgroundColor,
    this.childBackgroundColor,
    this.border,
  });

  /// List of user profile image.
  final List<Widget> images;

  /// Width and height of image.
  final double radius;

  /// determine the space between each image.
  final double space;

  /// Widget to show in circle avatar in last order.
  final Widget? child;

  /// Image background color.
  final Color? backgroundColor;

  /// Image background color for child.
  final Color? childBackgroundColor;

  /// Border for each image
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    final faceLength = images.length;

    final diameter = radius * 2;
    final hasChild = child != null ? 1 : 0;
    final facePileWidth = space * (faceLength + hasChild) + diameter - space;

    return SizedBox(
      width: facePileWidth,
      height: diameter,
      child: Stack(
        children: [
          if (child != null)
            Positioned(
              left: space * faceLength,
              child: AnimatedContainer(
                duration: kThemeChangeDuration,
                width: diameter,
                height: diameter,
                decoration: BoxDecoration(
                  border: border,
                  shape: BoxShape.circle,
                  color: childBackgroundColor,
                ),
                child: child,
              ),
            ),
          ...List.generate(
            faceLength,
            (index) {
              final newIndex = faceLength - index - 1;
              final image = images[newIndex];

              final avatar = AnimatedContainer(
                duration: kThemeChangeDuration,
                width: diameter,
                height: diameter,
                decoration: BoxDecoration(
                  border: border,
                  shape: BoxShape.circle,
                  color: backgroundColor,
                ),
                child: image,
              );

              return Positioned(
                left: space * newIndex,
                child: avatar,
              );
            },
          ),
        ],
      ),
    );
  }
}
