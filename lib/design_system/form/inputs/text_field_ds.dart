import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldDS extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String value)? onChanged;
  final bool obscureText;

  final String labelText;
  final String? errorText;
  final List<TextInputFormatter>? formatters;
  final Icon? preffixIcon;
  TextFieldDS(
      {Key? key,
      this.validator,
      required this.labelText,
      this.controller,
      this.keyboardType,
      this.onChanged,
      this.obscureText = false,
      this.errorText,
      this.formatters,
      this.preffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      inputFormatters: formatters,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        fillColor: Colors.white,
        filled: true,
        prefixIcon: preffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black26),
        ),
      ),
    );
  }
}
