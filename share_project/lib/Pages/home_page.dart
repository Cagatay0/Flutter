import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainWidget(),
    );
  }

  Widget mainWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          showImageWidget(),
          const SizedBox(height: 10),
          shareButtonWidget()
        ],
      ),
    );
  }

  Widget showImageWidget() {
    return GestureDetector(
      onTap: () async {
        final XFile? imageXFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (imageXFile != null) {
          imagePath = imageXFile.path;
          setState(() {});
        }
      },
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(),
        ),
        child: imagePath.isEmpty
            ? const Icon(
                Icons.image,
                size: 200,
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }

  Widget shareButtonWidget() {
    return GestureDetector(
      onTap: () {
        Share.shareXFiles(
          [XFile(imagePath)],
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.pinkAccent,
        ),
        child: const Text(
          'Share',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
