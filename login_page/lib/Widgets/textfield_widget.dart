import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.textEditingController,
    required this.focusNode,
  });
  final String hintText;
  final Widget prefixIcon;
  final TextEditingController textEditingController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
      child: Container(
        padding: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon,
              border: InputBorder.none),
        ),
      ),
    );
  }
}
