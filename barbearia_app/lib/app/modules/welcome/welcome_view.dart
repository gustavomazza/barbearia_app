import 'package:barbearia_app/app/global/widgets/rounded_button.dart';
import 'package:barbearia_app/app/modules/welcome/welcome_controller.dart';
import 'package:barbearia_app/app/modules/welcome/widgets/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WelcomePage')),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "WELCOME TO EDU",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Get.height * 0.05),
              SvgPicture.asset(
                "assets/chat.svg",
                height: Get.height * 0.45,
              ),
              SizedBox(height: Get.height * 0.05),
              RoundedButton(
                text: "LOGIN",
                press: () {},
              ),
              RoundedButton(
                text: "SIGN UP",
                color: Get.theme.primaryColorLight,
                textColor: Colors.black,
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
