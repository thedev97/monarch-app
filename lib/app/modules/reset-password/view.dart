import 'package:flutter/material.dart';
import 'widgets/forgot-pass-widget.dart';

class ResetPasswordView extends StatelessWidget {
  final String email;
  const ResetPasswordView({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ResetPasswordWidget(email: email,),
      ),
    );
  }
}
