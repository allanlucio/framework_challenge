import 'package:flutter/cupertino.dart';

class LogoDS extends StatelessWidget {
  const LogoDS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(tag: "applogo", child: Image.asset("assets/logo.png"));
  }
}
