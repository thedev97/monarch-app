import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../core/commons.dart';
import 'package:flutter/material.dart';
import '../../core/remote_url.dart';
import '../../core/values/strings.dart';
import 'package:Monarch/app/modules/dashboard/timeline.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool obscureText = false.obs;
  RxBool loading = false.obs;

  String? token;

  void loginApi() async {
    loading.value = true;
    try {
      final response = await post(Uri.parse(login_url), body: {
        "email": emailController.value.text,
        "password": passwordController.value.text
      });
      var data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        loading.value = false;
        Commons.successSnackBar(loginSuccess, loginSuccessMsg);
        Future.delayed(const Duration(milliseconds: 450),
            () => Get.to(() => Timeline(token: token!,)));
      } else {
        loading.value = false;
        Commons.errorSnackBar(loginFailed, data["status"]);
      }
    } catch (e) {
      loading.value = false;
      Commons.errorSnackBar('Exception', e.toString());
    }
  }
}
