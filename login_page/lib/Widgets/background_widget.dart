import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size phoneSize = MediaQuery.of(context).size;
    return SizedBox(
      width: phoneSize.width,
      height: phoneSize.height,
      child: Image.asset(
        'assets/background_images.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
