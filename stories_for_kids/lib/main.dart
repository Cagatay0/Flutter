import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stories_for_kids/Pages/home_page.dart';
import 'package:stories_for_kids/Utils/general_function.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //run splash page
  //datalar çek
  await GeneralFunction().getStoryList();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
