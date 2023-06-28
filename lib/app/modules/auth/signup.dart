import 'email_address.dart';
import 'package:get/get.dart';
import '../../core/commons.dart';
import '../../core/values/colors.dart';
import '../../core/values/images.dart';
import '../../core/values/sizes.dart';
import '../../core/values/strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../controllers/auth/signup.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaKey = GlobalKey<ScaffoldState>();

  SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        key: _scaKey,
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
          left: 25.0, right: 25.0, top: sizeHeight * 0.15, bottom: 20.0),
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
              child: Form(
                key: _formKey,
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
                      controller: signupController.nameController.value,
                      obscureText: signupController.obscureText.value,
                      label: "Your Name",
                      validatorFunction: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpaceRegular,
                    TextFormInput(
                      placeholder: "Email",
                      keyboardType: "text",
                      controller: signupController.emailController.value,
                      obscureText: signupController.obscureText.value,
                      label: "Your Email",
                      validatorFunction: (String? val) {
                        if (val!.isEmpty == true) {
                          return emailEmptyErrorMsg;
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpaceRegular,
                    Obx(
                      () => TextFormInput(
                        placeholder: "Password",
                        keyboardType: "text",
                        controller: signupController.passwordController.value,
                        obscureText: !signupController.obscureText.value,
                        label: "Your Password",
                        validatorFunction: (String? val) {
                          if (val!.isEmpty == true) {
                            return passwordEmptyErrorMsg;
                          } else {
                            return null;
                          }
                        },
                        showPasswordValue: () => signupController.obscureText
                            .value = !signupController.obscureText.value,
                      ),
                    ),
                    verticalSpaceMedium,
                    Obx(
                      () => signupController.loading.value
                          ? Padding(
                              padding:
                                  EdgeInsets.only(right: sizeWidth * 0.142),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: const SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.bottomRight,
                              child: AppPrimaryButton(
                                  buttonHeight: 40,
                                  buttonWidth: sizeWidth * 0.35,
                                  buttonText: signup_button,
                                  callback: () => signupController.signupApi()),
                            ),
                    ),
                    verticalSpaceRegular,
                  ],
                ),
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
              fontSize: 20,
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
