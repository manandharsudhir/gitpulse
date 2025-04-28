import 'package:flutter/material.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/logo/webpointLargePng.png",
      fit: BoxFit.fitWidth,
      width: 175,
    );
  }
}
