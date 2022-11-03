import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/values.dart';
import '../../widgets/background/white-background.dart';
import '../../widgets/forms/text_input_with _label.dart';
import '../../widgets/navigation/back.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  final String email;

  const SignUp({required this.email});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _confirmPassController = new TextEditingController();
  bool obscureText = false;
  bool obscureTextOne = false;

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
              child: SingleChildScrollView(
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NavigationBack(),
                    SizedBox(height: 40),
                    Text('Sign Up',
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
                        style:
                            GoogleFonts.lato(color: HexColor.fromHex("676979")),
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
                      placeholder: "Name",
                      keyboardType: "text",
                      controller: _nameController,
                      obscureText: obscureText,
                      label: "Your Name",
                      validatorFunction: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
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
                          if (!RegExp(
                                  r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,32}$')
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
                    SizedBox(height: 15),
                    TextFormInput(
                      placeholder: "Confirm Password",
                      keyboardType: "text",
                      controller: _confirmPassController,
                      obscureText: obscureText,
                      label: "Confirm Password",
                      validatorFunction: (value) {
                        if (value!.isEmpty) {
                          return "Please re-enter your password";
                        }
                        if (value != _passController.text) {
                          return "Passwords don't match";
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
                              Get.to(() => Login(email: widget.email));
                            }
                          },
                          style: ButtonStyles.blueRounded,
                          child: Text('Sign Up',
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("Already have an account?",
                              style: GoogleFonts.lato(
                                  color: HexColor.fromHex("676979"))),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Future.delayed(const Duration(microseconds: 50),
                                  () {
                                Get.to(Login(
                                  email: widget.email,
                                ));
                              });
                            },
                            child: Text(
                              "Login",
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(0.0, 1.0),
                                        blurRadius: 1.0),
                                  ],
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          )))
    ]));
  }
}
