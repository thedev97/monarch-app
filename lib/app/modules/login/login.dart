import 'package:flutter/material.dart';
import 'package:project_management_tool/app/modules/login/widgets/login-widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: LoginWidgets(),),
    );
  }
}
