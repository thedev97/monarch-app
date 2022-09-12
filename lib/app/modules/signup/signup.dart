import 'package:flutter/material.dart';
import 'package:project_management_tool/app/modules/signup/widgets/signup-widgets.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SignupWidgets(),
      ),
    );
  }
}
