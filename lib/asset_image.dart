import 'package:flutter/material.dart';

class LocalAssetImage extends StatelessWidget {
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double radius;
  final String imagePath;

  const LocalAssetImage({
    super.key,
    required this.imagePath,
    required this.radius,
    this.fit,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: Image.asset(
        imagePath,
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}
