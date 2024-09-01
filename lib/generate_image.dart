import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

class ImageWithText extends StatefulWidget {
  ImageWithText({required this.name});
  String name = 'Ravish';
  @override
  _ImageWithTextState createState() => _ImageWithTextState();
}

class _ImageWithTextState extends State<ImageWithText> {
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Screenshot(
              controller: screenshotController,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset('assets/background.jpeg'),
                  Text(
                    'Hello ${widget.name}!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveImage,
              child: Text('Download Image'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveImage() async {
    final Uint8List? image = await screenshotController.capture();
    if (image != null) {
      final result = await ImageGallerySaver.saveImage(image);
      if (result['isSuccess']) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image saved to gallery!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save image!')),
        );
      }
    }
  }
}
