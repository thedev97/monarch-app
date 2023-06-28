import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import '../../core/commons.dart';
import '../../core/remote_url.dart';
import '../../core/values/strings.dart';
import '../../modules/subscription/choose_plan.dart';


class SignupController extends GetxController {
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  RxBool obscureText = false.obs;
  RxBool loading = false.obs;

  void signupApi() async {
    loading.value = true;
    try {
      final response = await post(Uri.parse(signup_url), body: {
        "email": emailController.value.text,
        "password": passwordController.value.text,
        "name": nameController.value.text
      });
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        loading.value = false;
        Commons.successSnackBar(signupSuccess, signupSuccessMsg);
        Future.delayed(const Duration(milliseconds: 450),
            () => Get.to(const ChoosePlan()));
      } else {
        loading.value = false;
        Commons.errorSnackBar(signupFailed, data["email"]);
      }
    } catch (e) {
      loading.value = false;
      Commons.errorSnackBar('Exception', e.toString());
    }
  }
}
