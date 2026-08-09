import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
 final TextEditingController controller;
 final String hintText;
 final bool obscureText;
final IconData prefixIcon;
  const AuthTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.prefixIcon,
  });


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.black54,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
