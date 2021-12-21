import 'package:flutter/material.dart';

class FormDS extends StatelessWidget {
  final String title;
  final Widget child;
  final GlobalKey<FormState> formKey;
  final Function onFormSubmit;

  FormDS({
    Key? key,
    required this.title,
    required this.child,
    required this.onFormSubmit,
    GlobalKey<FormState>? formKey,
  })  : this.formKey = formKey ?? GlobalKey<FormState>(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            title.isNotEmpty ? _FormTitle(title: title) : SizedBox(),
            SizedBox(
              height: 30,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    child,
                    SizedBox(
                      height: 30,
                    ),
                    _SubmitButton(formKey: formKey, onFormSubmit: onFormSubmit)
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class _FormTitle extends StatelessWidget {
  const _FormTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.onFormSubmit,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final Function onFormSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            onFormSubmit();
            Navigator.pop(context);
          }
        },
        child: Text(
          "Adicionar",
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
