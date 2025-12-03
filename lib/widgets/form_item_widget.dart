import 'package:flutter/material.dart';

class FormItemWidget extends StatelessWidget {
  String hint;
  IconData iconData;
  TextEditingController controller;
  int maxLines;
  FormItemWidget({
    required this.controller,
    required this.hint,
    required this.iconData,
    this.maxLines = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          prefixIconColor: Colors.white,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.black.withOpacity(0.35),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}