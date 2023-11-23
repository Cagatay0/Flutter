// ignore_for_file: use_build_context_synchronously

import 'package:fb_storage_project/Pages/write_data_page.dart';
import 'package:fb_storage_project/Utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SmsAuthenticatePage extends StatefulWidget {
  const SmsAuthenticatePage({super.key});

  @override
  State<SmsAuthenticatePage> createState() => _SmsAuthenticatePageState();
}

class _SmsAuthenticatePageState extends State<SmsAuthenticatePage> {
  List<FocusNode> focusNodes = [];
  List<TextEditingController> controllers = [];
  int verificationCodeLength = 6;
  String pinCode = '';
  bool isOpenButton = false;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < verificationCodeLength; i++) {
      focusNodes.add(FocusNode());
      controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < verificationCodeLength; i++) {
      focusNodes[i].dispose();
      controllers[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainWidget(),
    );
  }

  Widget mainWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        pinCheckWidget(),
        const SizedBox(height: 20),
        checkVerificationButtonWidget(),
      ],
    );
  }

  Widget checkVerificationButtonWidget() {
    return GestureDetector(
      onTap: () async {
        for (var i = 0; i < verificationCodeLength; i++) {
          pinCode += controllers[i].text;
        }

        PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
            verificationId: verificationIdGlobal, smsCode: pinCode);
        print('phoneAuthCredential::::$phoneAuthCredential');
        await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WriteDataPage()));
      },
      child: Container(
        width: 100,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: !isOpenButton ? Colors.grey : Colors.amber,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Text('Verificate'),
      ),
    );
  }

  Widget pinCheckWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            width: 50,
            child: TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              maxLength: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                counterText: '',
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  if (index < verificationCodeLength - 1) {
                    focusNodes[index].unfocus();
                    FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                  } else {
                    focusNodes[index].unfocus();
                    isOpenButton = true;
                  }
                } else {
                  isOpenButton = false;
                }
                pinCode = '';
                setState(() {});
              },
            ),
          ),
        );
      }),
    );
  }
}
