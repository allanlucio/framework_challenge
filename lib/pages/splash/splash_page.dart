import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../design_system/logo/logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _animate = false;
  int _durationBase = 2000;
  double _iconHeigh = 200;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: _durationBase), () {
      Modular.to.navigate("/login");
    });
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.onSecondary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: (_durationBase / 4).floor()),
              height: _animate ? _iconHeigh : 0,
              child: AnimatedOpacity(
                  opacity: _animate ? 1 : 0,
                  duration: Duration(milliseconds: _durationBase - 500),
                  child: LogoDS()),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
