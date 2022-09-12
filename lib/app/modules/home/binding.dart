import 'package:get/get.dart';
import 'home-controller.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
    );
  }
}
