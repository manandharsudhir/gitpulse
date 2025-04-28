import 'package:flutter/material.dart';

import 'image_builder.dart';

class ImageContainerWithGradiant extends StatelessWidget {
  const ImageContainerWithGradiant(
      {super.key,
      required this.image,
      required this.height,
      required this.width});

  final String image;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ImageBuilder(
            url: image,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(94, 94, 94, 0.00),
                  Color.fromRGBO(32, 32, 32, 0.90),
                ],
              ),
              // image: DecorationImage(
              //   image: NetworkImage(highlightedImage),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
