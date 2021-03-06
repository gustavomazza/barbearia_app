import 'package:barbearia_app/app/data/model/auth_model.dart';
import 'package:barbearia_app/app/data/repository/auth_repository.dart';
import 'package:barbearia_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final repository = Get.find<AuthRepository>();
  Auth auth;
  final formkey = GlobalKey<FormState>();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  final box = GetStorage('barberapp');

  RxBool showPassword = false.obs;
  RxBool loading = false.obs;

  void login() async {
    if (formkey.currentState.validate()) {
      loading.value = true;
      print(usernameCtrl.text);
      print(passwordCtrl.text);
      //auth = await repository.login(usernameCtrl.text, passwordCtrl.text);

      Auth auth = await repository
          .login(usernameCtrl.text, passwordCtrl.text)
          .catchError((e) {
        loading.value = false;
      });

      if (!(auth == null)) {
        box.write('auth', auth);
        print(box.read('auth'));
        // print(auth.toJson());
        Get.offAllNamed(Routes.HOME);
      }
      loading.value = false;
    }
  }

  void toRegister() {
    Get.offAndToNamed(Routes.SIGNUP);
  }
}
