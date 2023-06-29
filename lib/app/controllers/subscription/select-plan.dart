import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../core/commons.dart';
import '../../core/remote_url.dart';
import '../../core/values/strings.dart';
import '../../modules/subscription/new_workspace.dart';

class SelectPlanController extends GetxController{
  RxBool loading = false.obs;

  void subscriptionApi(String email, String plan) async {
    loading.value = true;
    try {
      final response = await post(Uri.parse(subscription_url),
          body: {"email": email, "plan_type": plan});
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        loading.value = false;
        Commons.successSnackBar(selectPlanSuccess, planSuccessMsg);
        Future.delayed(
            const Duration(milliseconds: 450), () => Get.to(NewWorkSpace()));
      } else {
        loading.value = false;
        Commons.errorSnackBar(planFailed, data["Error"]);
      }
    } catch (e) {
      loading.value = false;
      Commons.errorSnackBar('Exception', e.toString());
    }
  }
}