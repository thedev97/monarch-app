import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_management_tool/app/core/values/colors.dart';
import 'package:project_management_tool/app/core/values/images.dart';
import 'package:project_management_tool/app/modules/auth/signup.dart';
import '../../core/commons.dart';
import '../../core/utils/custom-painter.dart';
import '../../core/values/sizes.dart';
import '../../core/values/strings.dart';
import '../../widgets/buttons/primary_buttons.dart';
import '../../widgets/forms/text_input_with _label.dart';
import '../../widgets/navigation/back_button.dart';
import 'choose_plan.dart';

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
    return Scaffold(
        extendBody: false,
        body: SafeArea(
          child: Stack(children: [
            Container(
              color: Colors.white,
            ),
            backgroundPainter(),
            loginContainer(),
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
            accountTxt(),
          ]),
        ));
  }

  Widget backgroundPainter() {
    return CustomPaint(
      painter: Painter(),
      child: Container(),
    );
  }

  Widget titleTxt() {
    return Text(login_title,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            fontSize: 25,
            shadows: [
              Shadow(
                  color: Colors.black,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 1.0),
            ],
            color: Colors.black));
  }

  Widget accountTxt() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: new Align(
        alignment: Alignment.bottomLeft,
        child: new RichText(
          text: TextSpan(
            text: exist_acc_txt,
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
                  ..onTap = () => Get.to(() => SignUp()),
                text: signup_text,
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

  Widget subTitleTxt() {
    return RichText(
      text: TextSpan(
        text: 'Using  ',
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.black.withOpacity(0.8)),
        children: <TextSpan>[
          TextSpan(
              text: "soumyaranjan61@gmail.com" ,
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(0.0, 0.5),
                        blurRadius: 0.2),
                  ],
                  color: Colors.black)),
          TextSpan(
              text: " to login.",
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.8))),
        ],
      ),
    );
  }

  Widget loginContainer() {
    return Padding(
      padding: EdgeInsets.only(
          left: 25.0, right: 25.0, top: sizeHeight * 0.18, bottom: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          child: CustomPaint(
            painter: PainterTwo(),
            child: Container(
              width: sizeWidth,
              padding: EdgeInsets.only(left: 15.0, top: 40.0, right: 15.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceMedium,
                  titleTxt(),
                  verticalSpaceSmall,
                  subTitleTxt(),
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
                  verticalSpaceMedium,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: AppPrimaryButton(
                        buttonHeight: 40,
                        buttonWidth: sizeWidth * 0.35,
                        buttonText: login_button,
                        callback: () => Get.to(() => ChoosePlan())),
                  ),
                  verticalLargeSpace,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: AppBackButton(
                      horizontalIcon: true,
                    ),
                  ),
                  verticalSpaceMedium,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
