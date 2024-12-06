// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailContentPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pictureDetail = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Gambar'),
        backgroundColor: Colors.deepPurple,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  pictureDetail['download_url'],
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16), 

              Text(
                'Author: ${pictureDetail['author']}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8), 

              if (pictureDetail['description'] != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Description: ${pictureDetail['description']}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
              SizedBox(height: 16), 
            ],
          ),
        ),
      ),
    );
  }
}
