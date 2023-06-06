import 'package:flutter/material.dart';
import 'package:galleryimage/asset_image.dart';

import 'gallery_item_model.dart';

// to show image in Row
class GalleryItemThumbnail extends StatelessWidget {
  final GalleryItemModel galleryItem;
  final GestureTapCallback? onTap;

  final double radius;

  const GalleryItemThumbnail({
    Key? key,
    required this.galleryItem,
    required this.onTap,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: galleryItem.id,
        child: LocalAssetImage(
          fit: BoxFit.cover,
          imagePath: galleryItem.imageUrl,
          radius: radius,
        ),
      ),
    );
  }
}
