import 'package:barbearia_app/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitialController extends GetxController {
  //Rx indica que é reativo, RxString, RxList, Rx<Auth>
  // RxString btText = "Botão Clicado 0 vezes.".obs;
  // RxInt num = 0.obs;
  final box = GetStorage('barberapp');
  var auth;

  String verifyAuth() {
    auth = box.read('auth');
    if (auth != null) {
      return Routes.HOME;
    } else {
      return Routes.WELCOME;
    }
  }
}
