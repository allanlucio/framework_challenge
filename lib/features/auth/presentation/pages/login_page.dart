import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/config/config.dart';
import '../../../../design_system/form/buttons/submit_button_ds.dart';
import '../../../../design_system/form/inputs/text_field_ds.dart';
import '../../../../design_system/logo/logo.dart';
import '../../../../design_system/snackbar/snackbar.dart';
import '../store/auth_cubit/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, AuthCubit> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: "");
  final passwordController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: BlocListener<AuthCubit, AuthState>(
        bloc: bloc,
        listener: (context, state) {
          state.whenOrNull(
            authenticated: (session) => Modular.to.navigate(HOME_PAGE),
            error: (message) => SnackBarDS.error(context, message: message),
          );
        },
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            LogoDS(),
            Text(
              "Fruit Shop",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 300,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFieldDS(
                        controller: emailController,
                        labelText: "Email",
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) => text != null && text.isEmpty
                            ? "Campo obrigatório"
                            : null,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldDS(
                        controller: passwordController,
                        labelText: "Senha",
                        obscureText: true,
                        validator: (text) => text != null && text.isEmpty
                            ? "Campo obrigatório"
                            : null,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SubmitButtonDS(
                        buttonText: "Entrar",
                        formKey: formKey,
                        onFormSubmit: () {
                          bloc.login(
                              email: emailController.text,
                              password: passwordController.text);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
