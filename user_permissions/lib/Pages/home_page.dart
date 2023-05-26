// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainWidget(),
    );
  }

  Widget mainWidget() {
    return Center(
      child: GestureDetector(
        onTap: () async {
          var status = await Permission.storage.status;
          print(status);

          if (status.isDenied) {
            print('İzin Hiç sorulmadı');
            await Permission.storage.request().then((value) {
              if (value.isGranted) {
                print('Kullanıcıya izin soruldu. İzni verdi');
              } else {
                print('Kullanıcıya izin soruldu. İzni reddetti');
              }
            });
          } else if (status.isGranted) {
            print('İzin önceden soruldu ve kullanıcı izni verdi');
          } else {
            print('İzin önceden soruldu ve kullanıcı izni vermedi');
          }
        },
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
    );
  }
}
