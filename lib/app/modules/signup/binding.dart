import 'package:get/get.dart';
import 'package:project_management_tool/app/modules/signup/signup-controller.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => SignupController(),
    );
  }
}