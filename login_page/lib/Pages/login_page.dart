// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:login_page/Utilities/constants.dart';
import 'package:login_page/Widgets/background_widget.dart';
import 'package:login_page/Widgets/login_container_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    textEditingControllerForUsername = TextEditingController();
    textEditingControllerForPassword = TextEditingController();
    focusNodeForUsername = FocusNode();
    focusNodeForPassword = FocusNode();
  }

  @override
  void dispose() {
    textEditingControllerForUsername.dispose();
    textEditingControllerForPassword.dispose();
    focusNodeForUsername.dispose();
    focusNodeForPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainWidget(),
    );
  }

  Widget mainWidget() {
    return Stack(
      children: [
        BackgroundWidget(),
        LoginContainerWidget(),
      ],
    );
  }
}
