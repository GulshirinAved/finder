import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:yitirdim/Screens/ProductProfileScreen/components/dot.dart';
import 'package:yitirdim/Screens/ProductProfileScreen/productProfileScreen_controller.dart';
import 'package:yitirdim/Theme/constants.dart';

class ViewWholePictureScreen extends StatelessWidget {
  final List imagelist;

  const ViewWholePictureScreen({super.key, required this.imagelist});

  @override
  Widget build(BuildContext context) {
    final _transformationController = TransformationController();
    PageController? _controller = PageController(initialPage: 0);
    ProductProfileController profileController =
        Get.put(ProductProfileController());

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeftCircle,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            // margin: EdgeInsets.only(bottom: 150, top: 150),
            alignment: Alignment.center,
            height: Get.height / 1.3,
            width: Get.width,
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (value) {
                profileController.swapDots(value);
              },
              itemCount: imagelist.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onDoubleTap: () {
                    // _transformationController.value = Matrix4.identity();
                    handleDoubleTap(_transformationController);
                  },
                  child: InteractiveViewer(
                    transformationController: _transformationController,
                    panEnabled: true,
                    maxScale: 5.0,
                    minScale: 0.01,
                    boundaryMargin: EdgeInsets.all(100),
                    child: Center(
                        child: CachedNetworkImage(
                      imageUrl:
                          'https://finder.alemtilsimat.com/storage/posts/${imagelist[index]['name']}',
                      fit: BoxFit.cover,
                      // fit: BoxFit.contain,
                      width: Get.width,
                    )),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              height: 4,
              width: Get.size.width,
              alignment: Alignment.bottomCenter,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: imagelist.length,
                itemBuilder: (context, index) {
                  return Obx(() => dot(profileController, index));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleDoubleTap(_transformationController) {
    TapDownDetails? doubleTapDetails;
    final double initialScale = 1.0;
    final double zoomScale = 2.0;

    if (_transformationController.value != Matrix4.identity()) {
      _transformationController.value = Matrix4.identity();
    } else {
      if (doubleTapDetails != null) {
        final position = doubleTapDetails.localPosition;

        _transformationController.value = Matrix4.identity()
          ..translate(-position.dx * 2, -position.dy * 2)
          ..scale(3.0);
      }
    }
  }
}
