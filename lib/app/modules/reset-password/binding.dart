import 'package:get/get.dart';
import 'controller.dart';

class ResetPasswordViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => ResetPasswordController(),
    );
  }
}