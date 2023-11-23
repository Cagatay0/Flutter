import 'package:fb_storage_project/Pages/login_page.dart';
import 'package:fb_storage_project/Pages/sms_authenticate_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MaterialApp(
    home: SmsAuthenticatePage(),
  ));
}
