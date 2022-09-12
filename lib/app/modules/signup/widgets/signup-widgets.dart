import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management_tool/app/core/commons.dart';
import 'package:project_management_tool/app/core/utils/extension.dart';
import 'package:project_management_tool/app/core/values/colors.dart';
import 'package:project_management_tool/app/core/values/icons.dart';
import 'package:project_management_tool/app/modules/home/view.dart';
import 'package:project_management_tool/app/modules/signup/signup-controller.dart';

class SignupWidgets extends StatelessWidget {
  final signupCtrl = Get.find<SignupController>();

  SignupWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Form(
          key: signupCtrl.formKey,
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
                            signupCtrl.fullNameCtrl.clear(),
                            signupCtrl.mobileCtrl.clear(),
                            signupCtrl.emailCtrl.clear(),
                            signupCtrl.passCtrl.clear(),
                            signupCtrl.confirmPassCtrl.clear(),
                            signupCtrl.designationCtrl.clear(),
                          });
                    },
                    icon: Icon(
                      backIcon,
                      color: Colors.black,
                    )),
              ),
              Center(
                child: Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                      fontSize: sizeHeight <= 700 ? 30.0 : 35.0,
                      color: Colors.black),
                ),
              ),
              verticalSpaceSmall,
              Center(
                child: Text(
                  'Fill the details & create your account',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: sizeHeight <= 700 ? 14.0 : 15.0,
                      color: Colors.grey[700]),
                ),
              ),
              verticalSpaceLarge,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
                child: TextFormField(
                  controller: signupCtrl.fullNameCtrl,
                  keyboardType: TextInputType.text,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                      color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 15.0),
                      child: Icon(
                        personIcon,
                        color: Colors.grey[600],
                      ), // Change this icon as per your requirement
                    ),
                    prefixIconConstraints: BoxConstraints(minWidth: 2.0),
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    hintText: "Enter Name",
                    hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '*Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
                child: TextFormField(
                  controller: signupCtrl.mobileCtrl,
                  keyboardType: TextInputType.phone,
                  textCapitalization: TextCapitalization.none,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                      color: Colors.black),
                  maxLength: 10,
                  autofocus: false,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 15.0),
                      child: Icon(
                        callIcon,
                        color: Colors.grey[600],
                      ), // Change this icon as per your requirement
                    ),
                    prefixIconConstraints: BoxConstraints(minWidth: 2.0),
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    hintText: "Enter Mobile No.",
                    hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*Please enter your phone number";
                    }
                    if (!RegExp(r'(^([5-9][0-9]{9})$)').hasMatch(value)) {
                      return "*Please enter a valid number";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
                child: TextFormField(
                  controller: signupCtrl.emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                      color: Colors.black),
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
                  autofocus: false,
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
                    controller: signupCtrl.passCtrl,
                    obscureText: signupCtrl.obscureTextOne.value,
                    textCapitalization: TextCapitalization.none,
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
                              signupCtrl.obscureTextOne.value =
                                  !signupCtrl.obscureTextOne.value;
                            } catch (exception) {
                              print(exception);
                            }
                          },
                          child: Icon(
                            signupCtrl.obscureTextOne.value
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
                    autofocus: false,
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
              Obx(
                () => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0.wp,
                  ),
                  child: TextFormField(
                    controller: signupCtrl.confirmPassCtrl,
                    obscureText: signupCtrl.obscureTextTwo.value,
                    textCapitalization: TextCapitalization.none,
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
                              signupCtrl.obscureTextTwo.value =
                                  !signupCtrl.obscureTextTwo.value;
                            } catch (exception) {
                              print(exception);
                            }
                          },
                          child: Icon(
                            signupCtrl.obscureTextTwo.value
                                ? eyesOffIcon
                                : eyesOnIcon,
                            color: Colors.grey[600],
                          )),
                      hintText: "Confirm Password",
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
                        return "*Please re-enter your password";
                      }
                      if (value != signupCtrl.passCtrl.text) {
                        return "*Passwords don't match";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
                child: TextFormField(
                  controller: signupCtrl.designationCtrl,
                  keyboardType: TextInputType.number,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                      color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 15.0),
                      child: Icon(
                        designationIcon,
                        color: Colors.grey[600],
                      ), // Change this icon as per your requirement
                    ),
                    prefixIconConstraints: BoxConstraints(minWidth: 2.0),
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    hintText: "Enter Designation",
                    hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '*Please enter your designation';
                    }
                    return null;
                  },
                ),
              ),
              verticalSpaceLarge,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sizeWidth * 0.25,
                ),
                child: SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      try {
                        if (signupCtrl.formKey.currentState!.validate()) {
                          Future.delayed(const Duration(microseconds: 50), () {
                            Get.to(HomeView());
                          });
                        }
                      } catch (exception) {
                        print(exception);
                      }
                    },
                    child: Text(
                      'Signup',
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
            ],
          )),
    );
  }
}
