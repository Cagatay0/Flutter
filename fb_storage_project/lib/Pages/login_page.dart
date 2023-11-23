import 'package:fb_storage_project/Pages/sms_authenticate_page.dart';
import 'package:fb_storage_project/Utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _controller;
  String phoneNumber = '';
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textFieldWidget(),
          const SizedBox(height: 10),
          sendSMSButtonWidget(),
        ],
      ),
    );
  }

  Widget textFieldWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
            border: InputBorder.none, hintText: '555 xxx xx xx'),
        onChanged: (value) {
          phoneNumber = value.toString().replaceAll(' ', '');
        },
      ),
    );
  }

  Widget sendSMSButtonWidget() {
    return GestureDetector(
      onTap: () {
        functionSendSMS();
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Text('Send SMS'),
      ),
    );
  }

  functionSendSMS() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {
        print('verificationCompleted::$phoneAuthCredential');
        await auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {
        print('verificationFailed::$error');
      },
      codeSent: (verificationId, forceResendingToken) async {
        print('codeSent verificationId::$verificationId');
        print('codeSent forceResendingToken::$forceResendingToken');
        verificationIdGlobal = verificationId;
        forceResendingTokenGlobal = forceResendingToken;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SmsAuthenticatePage()));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        print('codeAutoRetrievalTimeout::$verificationId');
      },
    );
  }
}
