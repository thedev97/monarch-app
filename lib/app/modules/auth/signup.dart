import 'choose_plan.dart';
import 'email_address.dart';
import 'package:get/get.dart';
import '../../core/commons.dart';
import '../../core/values/colors.dart';
import '../../core/values/images.dart';
import '../../core/values/sizes.dart';
import '../../core/values/strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../core/utils/custom-painter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/buttons/primary_buttons.dart';
import '../../widgets/forms/text_input_with _label.dart';
import '../../widgets/navigation/back_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _confirmPassController = new TextEditingController();
  bool obscureText = false;
  bool obscureTextOne = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        body: SafeArea(
          child: Stack(children: [
            Container(
              color: Colors.white,
            ),
            backgroundPainter(),
            accountTxt(),
            signupContainer(),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Image.asset(
                    butterfly_img,
                    height: 50,
                    width: 85,
                  ),
                )),
          ]),
        ));
  }

  Widget accountTxt() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: new Align(
        alignment: Alignment.bottomLeft,
        child: new RichText(
          text: TextSpan(
            text: login_acc_txt,
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                shadows: [
                  Shadow(
                      color: Colors.black,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 1.0),
                ],
                color: Colors.black),
            children: <TextSpan>[
              new TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Get.to(() => EmailAddressScreen()),
                text: login_text,
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 1.0),
                    ],
                    color: orange),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget backgroundPainter() {
    return CustomPaint(
      painter: Painter(),
      child: Container(),
    );
  }

  Widget signupContainer() {
    return Padding(
      padding: EdgeInsets.only(
          left: 25.0, right: 25.0, top: sizeHeight * 0.12, bottom: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          child: CustomPaint(
            painter: PainterThree(),
            child: Container(
              width: sizeWidth,
              padding: EdgeInsets.only(
                  left: 15.0, top: 10.0, right: 15.0, bottom: 10.0),
              child: Column(
                children: [
                  verticalSpaceRegular,
                  Align(
                    alignment: Alignment.topLeft,
                    child: AppBackButton(
                      horizontalIcon: false,
                    ),
                  ),
                  verticalSpaceRegular,
                  titleTxt(),
                  verticalSpaceRegular,
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
                  verticalSpaceRegular,
                  TextFormInput(
                    placeholder: "Email",
                    keyboardType: "text",
                    controller: _emailController,
                    obscureText: obscureText,
                    label: "Your Email",
                    validatorFunction: (String? val) {
                      if (val!.isEmpty == true) emailEmptyErrorMsg;
                    },
                  ),
                  verticalSpaceRegular,
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
                  verticalSpaceRegular,
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
                  verticalSpaceMedium,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: AppPrimaryButton(
                        buttonHeight: 40,
                        buttonWidth: sizeWidth * 0.35,
                        buttonText: signup_button,
                        callback: () => Get.to(() => ChoosePlan())),
                  ),
                  verticalSpaceRegular,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget titleTxt() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(signup_title,
          style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 25,
              shadows: [
                Shadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 1.0),
              ],
              color: Colors.black)),
    );
  }
}
