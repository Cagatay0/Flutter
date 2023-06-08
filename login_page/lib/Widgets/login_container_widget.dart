import 'package:flutter/material.dart';
import 'package:login_page/Widgets/inside_container_item_widget.dart';

class LoginContainerWidget extends StatelessWidget {
  const LoginContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size phoneSize = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          width: phoneSize.width,
          height: phoneSize.height * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: const InsideContainerItemWidget(),
        ),
      ),
    );
  }
}
