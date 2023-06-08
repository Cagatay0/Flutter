import 'package:flutter/material.dart';

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          print('Click Sign Up');
        },
        child: const Text(
          'SIGN UP',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
