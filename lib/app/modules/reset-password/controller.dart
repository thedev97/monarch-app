import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  GlobalKey<FormState> forgotKey = GlobalKey<FormState>();
  final resetPassCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();
  String newPassword = "";

  var obscureTextOne = true.obs;
  var obscureTextTwo = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
