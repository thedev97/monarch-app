import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import '../../core/commons.dart';
import '../../core/remote_url.dart';
import '../../core/values/strings.dart';
import '../../modules/subscription/choose_plan.dart';
import 'package:Monarch/app/data/auth/register.dart';

class SignupController extends GetxController {
  RegisterModel? registerModel;

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
      if (response.statusCode == 201) {
        loading.value = false;
        var result = jsonDecode(response.body);
        registerModel = RegisterModel.fromJson(result);
        Commons.successSnackBar(signupSuccess, signupSuccessMsg);
        Future.delayed(
            const Duration(milliseconds: 450),
            () => Get.to(ChoosePlan(
                  email: emailController.value.text,
                  userId: registerModel?.user.id ?? 0,
                  token: registerModel?.token.access ?? "",
                )));
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
