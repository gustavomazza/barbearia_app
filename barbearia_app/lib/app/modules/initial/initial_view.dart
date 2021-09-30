import 'package:barbearia_app/app/modules/initial/initial_controller.dart';
import 'package:barbearia_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

class InitialView extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 5,
          backgroundColor: Colors.white,
          // gradientBackground: const LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors: [
          //     Color(0xffED213A),
          //     Color(0xff93291E),
          //   ],
          // ),
          navigateAfterSeconds: Routes.WELCOME,
          loaderColor: Colors.transparent,
        ),
        Container(
          margin: EdgeInsets.all(100),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/splash.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    ));
  }
}
