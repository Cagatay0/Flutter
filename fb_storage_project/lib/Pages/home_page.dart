import 'dart:io';

import 'package:fb_storage_project/Widgets/global_button_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker imagePicker = ImagePicker();
  String imagePath = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainWidgetForHomePage(),
    );
  }

  Widget mainWidgetForHomePage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              storageStatusControl();
            },
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(24),
              ),
              child: imagePath == ''
                  ? const Center(child: Text('BOŞ'))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.file(
                        File(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 10),
          GlobalButtonWidget(
            text: 'Upload Storage',
            onTap: () async {
              print('start');
              List<String> imagePathList = imagePath.split('/');
              // print(imagePathList[imagePathList.length - 1]);

              await FirebaseStorage.instance
                  .ref('TestC')
                  .child('image.jpg')
                  .putFile(File(imagePath));
              print('finish');
            },
          ),
        ],
      ),
    );
  }

  storageStatusControl() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      await Permission.storage.request().then((value) async {
        final XFile? xFile =
            await imagePicker.pickImage(source: ImageSource.gallery);
        imagePath = xFile!.path;
        print('Image Path: $imagePath');
        setState(() {});
      });
    }
  }
}
