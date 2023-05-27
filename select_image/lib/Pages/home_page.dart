import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker picker = ImagePicker();
  String selectedImagePath = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initWidget(),
    );
  }

  Widget initWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          showImageWidget(),
          const SizedBox(height: 10),
          selectImageButtonWidget(),
        ],
      ),
    );
  }

  Widget showImageWidget() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: selectedImagePath == ''
          ? const Icon(
              Icons.image,
              size: 300,
            )
          : Image.file(
              File(selectedImagePath),
              fit: BoxFit.cover,
            ),
    );
  }

  Widget selectImageButtonWidget() {
    return GestureDetector(
      onTap: () => onTapFunction(),
      child: Container(
        alignment: Alignment.center,
        width: 200,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(40)),
        child: const Text(
          'Select Image',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }

  onTapFunction() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImagePath = image.path;
      setState(() {});
    }
  }
}
