import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginReuseableTextFormField extends StatelessWidget {
  const LoginReuseableTextFormField({
    super.key,
    required this.name,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.controller,
  });

  final String name;
  final String hintText;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      controller: controller,
      style: const TextStyle(
        fontSize: 18,
      ),
      decoration: InputDecoration(
        iconColor: Colors.blue,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText ?? false,
      validator: validator,
    );
  }
}
