import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;

  final int? maxLines;

  const CustomTextField({
    super.key, required this.hintText, required this.controller, required this.inputType,  this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: inputType,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,

          prefixIcon: Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15), child: Text('+880     |')),
          prefixStyle: TextStyle(color: Colors.black),
          // contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.2))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.2))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.2)))
      ),

    );
  }
}