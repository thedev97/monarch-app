import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../core/commons.dart';
import '../../core/remote_url.dart';
import 'package:flutter/material.dart';
import '../../core/values/strings.dart';
import '../../modules/auth/change-password.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:flutter_sms_autofill/flutter_sms_autofill.dart';

class VerifyEmailOTPController extends GetxController {
  CountdownController countdownController = CountdownController();
  TextEditingController otpController = TextEditingController();

  var messageOTPCode = ''.obs;

  RxBool obscureText = false.obs;
  RxBool loading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    print(await SmsAutoFill().getAppSignature);
    await SmsAutoFill().listenForCode;
  }

  @override
  void onReady() {
    super.onReady();
    countdownController.start();
  }

  @override
  void onClose() {
    super.onClose();
    otpController.dispose();
    SmsAutoFill().unregisterListener();
  }

  void verifyOTPApi(String email) async {
    loading.value = true;
    try {
      final response = await post(Uri.parse(verify_email_otp), body: {
        "email": email,
        "otp": otpController.value.text,
      });
      var data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        loading.value = false;
        Commons.successSnackBar(otpVerifiedSuccess, otpVerifiedSuccessMsg);
        Future.delayed(const Duration(milliseconds: 450),
            () => Get.to(ChangePassword(email: email)));
      } else {
        loading.value = false;
        Commons.errorSnackBar(verifiedOTPFailed, data["msg"]);
      }
    } catch (e) {
      loading.value = false;
      Commons.errorSnackBar('Exception', e.toString());
    }
  }
}
