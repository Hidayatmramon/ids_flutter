// ignore_for_file: prefer_const_constructors, unnecessary_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ids_project/core.dart';
import 'package:ids_project/service/picture/picture_service.dart';

class ListPictureView extends StatelessWidget {
  final controller = Get.put(ListPictureController());
  final PictureService pictureService = PictureService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Gambar'),
        backgroundColor: Colors.deepPurple, // Consistent app bar color
        elevation: 4,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.pictures.length,
          itemBuilder: (context, index) {
            final picture = controller.pictures[index];

            return GestureDetector(
              onTap: () async {
                try {
                  final pictureDetail = await pictureService.fetchPictureDetail(int.parse(picture['id']));
                  Get.toNamed(
                    Routes.DETAIL,
                    arguments: pictureDetail,
                  );
                } catch (e) {
                  Get.snackbar(
                    'Error',
                    'Failed to load picture details',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 8,
                shadowColor: Colors.black45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        picture['download_url'],
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover, // Better image fit
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        picture['author'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'Tap for details...',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
