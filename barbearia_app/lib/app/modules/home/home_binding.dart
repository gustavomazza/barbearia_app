import 'package:barbearia_app/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<AuthRepository>(() => AuthRepository());
    // Get.lazyPut<AuthApiClient>(() => AuthApiClient());
  }
}
