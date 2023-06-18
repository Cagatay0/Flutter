// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login_page/Utilities/constants.dart';
import 'package:login_page/Widgets/forgot_password_widget.dart';
import 'package:login_page/Widgets/general_gradient_button_widget.dart';
import 'package:login_page/Widgets/general_header_text_widget.dart';
import 'package:login_page/Widgets/sign_up_button_widget.dart';
import 'package:login_page/Widgets/textfield_widget.dart';

class InsideContainerItemWidget extends StatelessWidget {
  const InsideContainerItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginTextWidget(),
        TextFieldWidget(
          hintText: 'Username',
          focusNode: focusNodeForUsername,
          textEditingController: textEditingControllerForUsername,
          prefixIcon: Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
        TextFieldWidget(
          hintText: 'Password',
          focusNode: focusNodeForUsername,
          textEditingController: textEditingControllerForUsername,
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.black,
          ),
        ),
        ForgotPasswordWidget(),
        LoginButtonWidget(),
        const Spacer(),
        SignUpButtonWidget(),
      ],
    );
  }
}
