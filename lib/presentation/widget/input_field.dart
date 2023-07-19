import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  CustomInputField(this.hint,this.controller,{this.validator, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10.0),
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: hint),
        ),
      ),
    );
  }
}
