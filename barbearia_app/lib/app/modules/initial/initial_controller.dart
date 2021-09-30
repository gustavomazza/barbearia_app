import 'package:get/get.dart';

class InitialController extends GetxController {
  //Rx indica que é reativo, RxString, RxList, Rx<Auth>
  // RxString btText = "Botão Clicado 0 vezes.".obs;
  RxInt num = 0.obs;

  void btClick() {
    print('click');
    num += 1;
  }
}
