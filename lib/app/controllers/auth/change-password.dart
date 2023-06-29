import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import '../../core/commons.dart';
import '../../core/remote_url.dart';
import '../../core/values/strings.dart';
import '../../modules/auth/login.dart';

class ChangePasswordController extends GetxController {
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  RxBool obscureText = false.obs;
  RxBool obscureText1 = false.obs;
  RxBool loading = false.obs;

  void changePasswordApi(String email) async {
    loading.value = true;
    try {
      final response = await post(Uri.parse(change_password), body: {
        "email": email,
        "password": passwordController.value.text,
        "confirm_password": confirmPasswordController.value.text
      });
      var data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        loading.value = false;
        Commons.successSnackBar(
            changePasswordSuccess, changePasswordSuccessMsg);
        Future.delayed(
            const Duration(milliseconds: 450), () => Get.to(Login()));
      } else {
        loading.value = false;
        Commons.errorSnackBar(changePasswordFailed, data["Error"]);
      }
    } catch (e) {
      loading.value = false;
      Commons.errorSnackBar('Exception', e.toString());
    }
  }
}
