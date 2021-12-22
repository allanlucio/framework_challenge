import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../design_system/form/buttons/elevated_button_ds.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ElevatedButtonDS(
        title: "Finalizar",
        icon: Icons.check,
        onPressed: onPressed,
        buttomColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
