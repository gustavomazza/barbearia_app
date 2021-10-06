import 'package:barbearia_app/app/data/model/user_model.dart';
import 'package:barbearia_app/app/data/repository/auth_repository.dart';
import 'package:barbearia_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final repository = Get.find<AuthRepository>();
  final formkey = GlobalKey<FormState>();

  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  User user;

  RxBool showPassword = false.obs;
  RxBool loading = false.obs;

  void register() async {
    if (formkey.currentState.validate()) {
      loading.value = true;
      print(usernameCtrl.text);
      print(passwordCtrl.text);
      User user = await repository
          .register(usernameCtrl.text, passwordCtrl.text)
          .catchError((e) {
        loading.value = false;
      });
      if (!(user == null)) {
        //Alert Usuário criado com sucesso.
        //Direcionar para a tela de login

        usernameCtrl.text = '';
        passwordCtrl.text = '';
        Get.offAllNamed(Routes.LOGIN);
      }

      loading.value = false;
    }
  }

  void toLogin() {
    Get.offAndToNamed(Routes.LOGIN);
  }
}
