import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import '../../core/commons.dart';
import '../../core/remote_url.dart';
import '../../core/values/strings.dart';
import 'package:Monarch/app/modules/auth/verify-otp-email.dart';

class EmailSendOTPController extends GetxController {
  final emailController = TextEditingController().obs;

  RxBool obscureText = false.obs;
  RxBool loading = false.obs;

  void emailSendOTPApi() async {
    loading.value = true;
    try {
      final response = await post(Uri.parse(send_email_otp), body: {
        "email": emailController.value.text,
      });
      var data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        loading.value = false;
        Commons.successSnackBar(otpSendSuccess, otpSendSuccessMsg);
        Future.delayed(const Duration(milliseconds: 450),
            () => Get.to(VerifyEmailOTP(email: emailController.value.text)));
      } else {
        loading.value = false;
        Commons.errorSnackBar(sendOTPFailed, data["detail"]);
      }
    } catch (e) {
      loading.value = false;
      Commons.errorSnackBar('Exception', e.toString());
    }
  }
}
