import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginReuseableTextFormField extends StatelessWidget {
  const LoginReuseableTextFormField({
    super.key,
    required this.name,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
  });

  final String name;
  final String hintText;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
        iconColor: Colors.blue,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        contentPadding: const EdgeInsets.all(16.0),
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText ?? false,
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(),
        ],
      ),
    );
  }
}
