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
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Bem vindo ao Barber App",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Get.height * 0.05),
              // Container(
              //   margin: EdgeInsets.all(100),
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage("assets/splash.png"),
              //       fit: BoxFit.contain,
              //     ),
              //   ),
              // ),
              SvgPicture.asset(
                // "assets/splash.jpg",
                "assets/chat.svg",
                height: Get.height * 0.45,
              ),
              SizedBox(height: Get.height * 0.05),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  Get.offAndToNamed("/login");
                },
              ),
              RoundedButton(
                text: "REGISTRAR",
                color: Get.theme.primaryColorLight,
                textColor: Colors.black,
                press: () {
                  Get.offAndToNamed("/signup");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
