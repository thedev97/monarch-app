import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final fullNameCtrl = TextEditingController();
  final mobileCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();
  final designationCtrl = TextEditingController();

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
