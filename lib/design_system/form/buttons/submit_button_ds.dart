import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmitButtonDS extends StatelessWidget {
  const SubmitButtonDS({
    Key? key,
    this.formKey,
    required this.onFormSubmit,
    this.buttonText = "Adicionar",
  }) : super(key: key);

  final GlobalKey<FormState>? formKey;
  final Function onFormSubmit;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (formKey == null) {
            onFormSubmit();
          } else if (formKey!.currentState!.validate()) {
            onFormSubmit();
          }
        },
        style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.secondary),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
      ),
    );
  }
}
