import 'package:flutter/material.dart';
import 'package:local_notification_app/local_notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    LocalNotificationService().startup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainWidget(),
    );
  }

  Widget mainWidget() {
    return Center(
      child: GestureDetector(
        onTap: () => LocalNotificationService().showNotification(),
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: const Text(
            'Send Notification',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
