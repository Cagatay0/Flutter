import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WriteDataPage extends StatefulWidget {
  const WriteDataPage({super.key});

  @override
  State<WriteDataPage> createState() => _WriteDataPageState();
}

class _WriteDataPageState extends State<WriteDataPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainWidget(),
    );
  }

  Widget mainWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              saveDataFunction();
            },
            child: Container(
              width: 100,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.green),
              child: const Text(
                'Save Data',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              updateDataFunction();
            },
            child: Container(
              width: 100,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.yellow),
              child: const Text(
                'Update Data',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              deleteDataFunction();
            },
            child: Container(
              width: 100,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.red),
              child: const Text(
                'Delete Data',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              getDataFunction();
            },
            child: Container(
              width: 100,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.blue),
              child: const Text(
                'Get Data',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }

  saveDataFunction() async {
    Map<String, dynamic> saveData = {'name': _controller.text};
    print('Start');
    await FirebaseFirestore.instance
        .collection('User')
        .doc('dokumanName')
        .set(saveData);
    print('Finish');
  }

  updateDataFunction() async {
    Map<String, dynamic> updateData = {
      'name': _controller.text + _controller.text
    };
    print('Start');

    await FirebaseFirestore.instance
        .collection('User')
        .doc('dokumanName')
        .update(updateData);
    print('Finish');
  }

  deleteDataFunction() async {
    print('Start');
    await FirebaseFirestore.instance
        .collection('User')
        .doc('dokumanName')
        .delete();
    print('Finish');
  }

  getDataFunction() async {
    print('Start');
    // await FirebaseFirestore.instance
    //     .collection('User')
    //     .doc('dokumanName')
    //     .get()
    //     .then((value) {
    //   print(value.data());
    // });
    await FirebaseFirestore.instance.collection('User').get().then(
      (value) {
        for (var element in value.docs) {
          print(element.data());
        }
      },
    );
    print('Finish');
  }
}
