import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';

void main() async {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Number Trivia',
        theme: ThemeData(
          primaryColor: Color(0xff3AB795),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color(0xff3AB795),
            selectedItemColor: Color(0xffFFCF56),
          ),
          colorScheme: ColorScheme(
              primary: Color(0xff3AB795),
              secondary: Color(0xffF52D2D),
              surface: Color(0xffEDEAD0),
              onSurface: Colors.black,
              onPrimary: Color(0xffEDEAD0),
              background: Color(0xffEDEAD0),
              onBackground: Colors.black,
              brightness: Brightness.light,
              error: Colors.red,
              onError: Color(0xffEDEAD0),
              primaryVariant: Color(0xff86BAA1),
              secondaryVariant: Color(0xff86BAA1),
              onSecondary: Color(0xffA0E8AF)),
        )).modular();
  }
}
