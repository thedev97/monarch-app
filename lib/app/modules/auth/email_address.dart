import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_management_tool/app/modules/Auth/signup.dart';
import '../../core/values/values.dart';
import '../../widgets/background/white-background.dart';
import '../../widgets/forms/text_input_with _label.dart';
import '../../widgets/navigation/back.dart';

class EmailAddressScreen extends StatefulWidget {
  @override
  _EmailAddressScreenState createState() => _EmailAddressScreenState();
}

class _EmailAddressScreenState extends State<EmailAddressScreen> {
  TextEditingController _emailController = new TextEditingController();
  bool obscureText = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            NavigationBack(),
            SizedBox(height: 40),
            Text("What's your\nemail\naddress?",
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
            TextFormInput(
                placeholder: "Email",
                keyboardType: "text",
                controller: _emailController,
                obscureText: obscureText,
                validatorFunction: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  }
                  if (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(value) ==
                      false) {
                    return "Please enter a valid email";
                  } else {
                    return null;
                  }
                },
                label: "Your Email"),
            SizedBox(height: 40),
            Container(
              height: 55,
              width: sizeWidth * 0.45,
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.to(() => SignUp(email: _emailController.text));
                    }
                  },
                  style: ButtonStyles.blueRounded,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Continue with Email',
                          style: GoogleFonts.lato(
                              shadows: [
                                Shadow(
                                    color: Colors.black,
                                    offset: Offset(0.0, 1.0),
                                    blurRadius: 1.0),
                              ],
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.white)),
                    ],
                  )),
            )
          ]),
        )),
      )
    ]));
  }
}
