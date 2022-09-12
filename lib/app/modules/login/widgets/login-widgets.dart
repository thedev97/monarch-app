import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_management_tool/app/core/commons.dart';
import 'package:project_management_tool/app/core/utils/extension.dart';
import 'package:project_management_tool/app/core/values/colors.dart';
import 'package:project_management_tool/app/core/values/icons.dart';
import 'package:project_management_tool/app/core/values/images.dart';
import 'package:project_management_tool/app/modules/forgot-password/view.dart';
import 'package:project_management_tool/app/modules/login/login-controller.dart';
import 'package:project_management_tool/app/modules/signup/signup.dart';

class LoginWidgets extends StatelessWidget {
  final loginCtrl = Get.find<LoginController>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 10, bottom: sizeHeight <= 700 ? 15 : 20, left: 15),
                child: IconButton(
                    alignment: Alignment.topLeft,
                    onPressed: () {
                      Future.delayed(Duration(microseconds: 20), () {
                        Navigator.pop(context);
                      }).then((value) => {
                            loginCtrl.emailCtrl.clear(),
                            loginCtrl.passCtrl.clear(),
                          });
                    },
                    icon: Icon(
                      backIcon,
                      color: Colors.black,
                    )),
              ),
              Center(
                child: Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                      fontSize: sizeHeight <= 700 ? 30.0 : 35.0,
                      color: Colors.black),
                ),
              ),
              Center(
                child: SvgPicture.asset(
                  loginImg,
                  width: sizeWidth * 0.45,
                  height:
                      sizeHeight <= 700 ? sizeHeight * 0.38 : sizeHeight * 0.42,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
                child: TextFormField(
                  controller: loginCtrl.emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                      color: Colors.black),
                  autofocus: false,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 15.0),
                      child: Icon(
                        emailIcon,
                        color: Colors.grey[600],
                      ), // Change this icon as per your requirement
                    ),
                    prefixIconConstraints: BoxConstraints(minWidth: 2.0),
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    hintText: "Enter Email",
                    hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*Please enter your email";
                    }
                    if (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(value) ==
                        false) {
                      return "*Please enter a valid email";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              verticalSpaceMedium,
              Obx(
                () => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0.wp,
                  ),
                  child: TextFormField(
                    controller: loginCtrl.passCtrl,
                    obscureText: loginCtrl.obscureText.value,
                    textCapitalization: TextCapitalization.none,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 15.0),
                        child: Icon(
                          passwordIcon,
                          color: Colors.grey[600],
                        ), // Change this icon as per your requirement
                      ),
                      prefixIconConstraints: BoxConstraints(minWidth: 2.0),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      suffix: GestureDetector(
                          onTap: () async {
                            try {
                              loginCtrl.obscureText.value =
                                  !loginCtrl.obscureText.value;
                            } catch (exception) {
                              print(exception);
                            }
                          },
                          child: Icon(
                            loginCtrl.obscureText.value
                                ? eyesOffIcon
                                : eyesOnIcon,
                            color: Colors.grey[600],
                          )),
                      hintText: "Enter Password",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "*Please enter your password";
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
                ),
              ),
              verticalSpaceMedium,
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 30.0),
                  child: GestureDetector(
                      onTap: () {
                        Future.delayed(const Duration(microseconds: 50), () {
                          Get.to(ForgotPasswordView());
                        });
                      },
                      child: Text("Forgot Password?",
                          textScaleFactor: 1,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                  color: Colors.black))),
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sizeWidth * 0.25,
                ),
                child: SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      try {
                        if (_formKey.currentState!.validate()) {
                          Future.delayed(const Duration(microseconds: 50), () {
                            Get.to(SignupView());
                          });
                        }
                      } catch (exception) {
                        print(exception);
                      }
                    },
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: StadiumBorder(),
                    ),
                  ),
                ),
              ),
              verticalSpaceMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account?",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          color: Colors.grey[500])),
                  SizedBox(
                    width: 8.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Future.delayed(const Duration(microseconds: 50), () {
                        Get.to(SignupView());
                      });
                    },
                    child: Text(
                      "Sign up",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              verticalSpaceSmall,
            ],
          )),
    );
  }
}
