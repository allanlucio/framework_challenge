import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElevatedButtonDS extends StatelessWidget {
  const ElevatedButtonDS({
    Key? key,
    this.onPressed,
    required this.title,
    required this.icon,
    this.fontSize,
  }) : super(key: key);

  final Function()? onPressed;
  final String title;
  final IconData icon;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.secondary),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize ?? 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Icon(
                icon,
                color: Colors.white,
                size: (fontSize ?? 20) + 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
