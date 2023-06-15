library galleryimage;

import 'package:flutter/material.dart';

import 'gallery_item_model.dart';
import './gallery_image_view_wrapper.dart';
import 'images_widget.dart';

class GalleryImage extends StatefulWidget {
  final List<String> imageUrls;
  final String? titleGallery;
  final int numOfShowImages;
  final EdgeInsetsGeometry padding;
  final Color? colorOfNumberWidget;
  final Color galleryBackgroundColor;
  final TextStyle? textStyleOfNumberWidget;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final double minScale;
  final double maxScale;
  final double imageRadius;
  final bool reverse;
  final bool showListInGalley;
  final bool showAppBar;
  final bool closeWhenSwipeUp;
  final bool closeWhenSwipeDown;

  const GalleryImage({
    Key? key,
    required this.imageUrls,
    this.titleGallery,
    this.numOfShowImages = 3,
    this.colorOfNumberWidget,
    this.textStyleOfNumberWidget,
    this.padding = EdgeInsets.zero,
    this.loadingWidget,
    this.errorWidget,
    this.galleryBackgroundColor = Colors.black,
    this.minScale = .5,
    this.maxScale = 10,
    this.imageRadius = 8,
    this.reverse = false,
    this.showListInGalley = true,
    this.showAppBar = true,
    this.closeWhenSwipeUp = false,
    this.closeWhenSwipeDown = false,
  })  : assert(numOfShowImages <= imageUrls.length),
        super(key: key);
  @override
  State<GalleryImage> createState() => _GalleryImageState();
}

class _GalleryImageState extends State<GalleryImage> {
  List<GalleryItemModel> galleryItems = <GalleryItemModel>[];
  @override
  void initState() {
    _buildItemsList(widget.imageUrls);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return galleryItems.isEmpty
        ? const SizedBox.shrink()
        : DynamicImagesWidget(
            imagesList: galleryItems,
            onTap: (index) {
              _openImageFullScreen(index);
            },
          );
  }

// to open gallery image in full screen
  Future<void> _openImageFullScreen(int indexOfImage) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryImageViewWrapper(
          titleGallery: widget.titleGallery,
          galleryItems: galleryItems,
          backgroundColor: widget.galleryBackgroundColor,
          initialIndex: indexOfImage,
          loadingWidget: widget.loadingWidget,
          errorWidget: widget.errorWidget,
          maxScale: widget.maxScale,
          minScale: widget.minScale,
          reverse: widget.reverse,
          showListInGalley: widget.showListInGalley,
          showAppBar: widget.showAppBar,
          closeWhenSwipeUp: widget.closeWhenSwipeUp,
          closeWhenSwipeDown: widget.closeWhenSwipeDown,
          radius: widget.imageRadius,
        ),
      ),
    );
  }

// clear and build list
  void _buildItemsList(List<String> items) {
    galleryItems.clear();
    for (var item in items) {
      galleryItems.add(
        GalleryItemModel(
            id: '${widget.titleGallery}$item',
            imageUrl: item,
            index: items.indexOf(item)),
      );
    }
  }
}
