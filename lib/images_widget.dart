import 'package:flutter/material.dart';

import 'gallery_item_model.dart';

class DynamicImagesWidget extends StatelessWidget {
  final List<GalleryItemModel> imagesList;
  final Function(int) onTap;
  const DynamicImagesWidget({
    super.key,
    required this.imagesList,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(0);
      },
      child: SizedBox(
        height: 152,
        width: double.infinity,
        child: imagesList.length == 1
            ? Image.asset(
                imagesList[0].imageUrl,
                height: double.infinity,
                width: double.infinity,
              )
            : imagesList.length == 2
                ? Row(children: [
                    Expanded(
                        child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                      child: InkWell(
                          onTap: () {
                            onTap(0);
                          },
                          child: Image.asset(
                            imagesList[0].imageUrl,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )),
                    )),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      child: InkWell(
                          onTap: () {
                            onTap(1);
                          },
                          child: Image.asset(
                            imagesList[1].imageUrl,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )),
                    ))
                  ])
                : Row(children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        child: InkWell(
                          onTap: () {
                            onTap(0);
                          },
                          child: Image.asset(
                            imagesList[0].imageUrl,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                              ),
                              child: InkWell(
                                onTap: () {
                                  onTap(1);
                                },
                                child: Image.asset(
                                  imagesList[1].imageUrl,
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                              child: InkWell(
                                onTap: () {
                                  onTap(2);
                                },
                                child: Image.asset(
                                  imagesList[2].imageUrl,
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
      ),
    );
  }
}
