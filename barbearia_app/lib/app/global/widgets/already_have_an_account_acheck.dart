import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Não possui uma conta ? " : "Já possui cadastro ? ",
          style: TextStyle(color: Get.theme.primaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Registrar" : "Entrar",
            style: TextStyle(
              color: Get.theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
