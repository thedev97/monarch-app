import 'package:flutter/material.dart';
import 'widgets/forgot-pass-widget.dart';

class ForgotPasswordView extends StatelessWidget {

  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ForgotPasswordWidget(),
      ),
    );
  }
}
