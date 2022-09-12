import 'package:get/get.dart';
import 'package:project_management_tool/app/modules/login/login-controller.dart';

// ?? Bindings should be extended or implemented.
// When using GetMaterialApp, all GetPages and
// navigation methods (like Get.to()) have a binding property
// that takes an instance of Bindings to manage the dependencies()
// (via Get.put()) for the Route you are opening.
class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => LoginController(),
    );
  }
}