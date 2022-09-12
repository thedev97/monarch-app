import 'package:get/get.dart';
import 'controller.dart';

class ForgotPasswordViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ForgotPasswordController(),
    );
  }
}
