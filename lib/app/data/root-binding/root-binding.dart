import 'package:get/get.dart';
import 'package:project_management_tool/app/modules/forgot-password/controller.dart';
import 'package:project_management_tool/app/modules/login/login-controller.dart';
import 'package:project_management_tool/app/modules/reset-password/controller.dart';
import 'package:project_management_tool/app/modules/signup/signup-controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<SignupController>(SignupController());
    Get.put<ForgotPasswordController>(ForgotPasswordController());
    Get.put<ResetPasswordController>(ResetPasswordController());
  }
}
