import 'package:barbearia_app/app/data/provider/auth_provider.dart';
import 'package:barbearia_app/app/data/repository/auth_repository.dart';
import 'package:barbearia_app/app/modules/signup/signup_controller.dart';
import 'package:get/get.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );

    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );

    Get.lazyPut<AuthApiClient>(
      () => AuthApiClient(),
    );
  }
}
