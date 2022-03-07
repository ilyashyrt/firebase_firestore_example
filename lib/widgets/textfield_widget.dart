// ignore_for_file: prefer_const_constructors

import 'package:deneme_appppp/utils/device_utils.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final IconData icon;
  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.labelText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal,width: DeviceUtils.getScaledWidth(context, 0.5))),
        hintText: hintText ?? "",
        labelText: labelText ?? "",
        prefixIcon: Icon(
          icon,
          color: Colors.teal,
        ),
      ),
    );
  }
}
