import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../core/commons.dart';
import '../../core/remote_url.dart';
import 'package:flutter/material.dart';
import '../../core/values/strings.dart';
import '../../data/project/add_project_model.dart';

class AddProjectController extends GetxController {
  AddProjectModel? addProjectModel;
  final projectNameController = TextEditingController().obs;
  final descController = TextEditingController().obs;
  final categoryController = TextEditingController().obs;

  RxBool loading = false.obs;

  void createProject() async {
    loading.value = true;
    try {
      final response = await post(Uri.parse(add_project_url), body: {
        "project_title": projectNameController.value.text,
        "primary_member": "19",
        "team_member": ["19"],
        "des": descController.value.text,
        "category": categoryController.value.text
      });
      var data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        loading.value = false;
        var result = jsonDecode(response.body);
        addProjectModel = AddProjectModel.fromJson(result);
        Commons.successSnackBar(addProjectSuccess, addProjectSuccessMsg);
      } else {
        loading.value = false;
        Commons.errorSnackBar(failedAddProjectMsg, data["email"]);
      }
    } catch (e) {
      loading.value = false;
      Commons.errorSnackBar('Exception', e.toString());
    }
  }
}
