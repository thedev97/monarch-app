import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_management_tool/app/core/values/values.dart';
import 'package:project_management_tool/app/modules/auth/new_workspace.dart';
import '../../widgets/background/white-background.dart';
import '../../widgets/forms/text_input_with _label.dart';
import '../../widgets/navigation/back.dart';

class Login extends StatefulWidget {
  final String email;

  const Login({Key? key, required this.email}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _passController = new TextEditingController();
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(children: [
      WhiteBackground(
        color: HexColor.fromHex("#f8eee4"),
        position: "topLeft",
      ),
      Padding(
        padding: EdgeInsets.all(20.0),
        child: SafeArea(
            child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavigationBack(),
              SizedBox(height: 40),
              Text('Login',
                  style: GoogleFonts.lato(
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 1.0),
                    ],
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: sizeHeight <= 700 ? 30.0 : 38.0,
                  )),
              AppSpaces.verticalSpace20,
              RichText(
                text: TextSpan(
                  text: 'Using  ',
                  style: GoogleFonts.lato(color: HexColor.fromHex("676979")),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.email,
                        style: GoogleFonts.lato(
                            color: HexColor.fromHex("676979"))),
                    TextSpan(
                        text: "  to login.",
                        style: GoogleFonts.lato(
                            color: HexColor.fromHex("676979"))),
                  ],
                ),
              ),
              SizedBox(height: 30),
              TextFormInput(
                placeholder: "Password",
                keyboardType: "text",
                controller: _passController,
                obscureText: obscureText,
                label: "Your Password",
                validatorFunction: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  }
                  if (value.length < 8) {
                    return "8 characters, 1 uppercase, 1 lowercase and 1 number required.";
                  } else if (value.length > 8 || value.length == 8) {
                    var returnString;
                    if (!RegExp(r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,32}$')
                        .hasMatch(value)) {
                      returnString =
                          "8 characters, 1 uppercase, 1 lowercase and 1 number required.";
                    }
                    return returnString;
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 40),
              Container(
                height: 55,
                width: sizeWidth * 0.45,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.to(() => NewWorkSpace());
                      }
                    },
                    style: ButtonStyles.blueRounded,
                    child: Text('Sign In',
                        style: GoogleFonts.lato(
                            shadows: [
                              Shadow(
                                  color: Colors.black,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 1.0),
                            ],
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.white))),
              )
            ],
          ),
        )),
      )
    ]));
  }
}
