import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final otpCtrl = TextEditingController();
  var otpValidate = false.obs;
  FocusNode textSecondFocusNode = new FocusNode();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
