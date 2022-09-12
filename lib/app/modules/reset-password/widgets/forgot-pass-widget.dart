import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management_tool/app/core/commons.dart';
import 'package:project_management_tool/app/core/utils/extension.dart';
import 'package:project_management_tool/app/core/values/colors.dart';
import 'package:project_management_tool/app/core/values/icons.dart';
import 'package:project_management_tool/app/modules/login/login.dart';
import 'package:project_management_tool/app/modules/reset-password/controller.dart';

class ResetPasswordWidget extends StatelessWidget {
  final resetPassCtrl = Get.find<ResetPasswordController>();
  final String email;

  ResetPasswordWidget({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Form(
          key: resetPassCtrl.forgotKey,
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
                            resetPassCtrl.resetPassCtrl.clear(),
                            resetPassCtrl.confirmPassCtrl.clear(),
                          });
                    },
                    icon: Icon(
                      backIcon,
                      color: Colors.black,
                    )),
              ),
              Center(
                child: Text(
                  'Reset Your Password?',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                      fontSize: sizeHeight <= 700 ? 30.0 : 35.0,
                      color: Colors.black),
                ),
              ),
              verticalSpaceSmall,
              Center(
                child: Column(
                  children: [
                    Text(
                      'Your account will be safe and the OTP will receive on this',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: sizeHeight <= 700 ? 14.0 : 15.0,
                          color: Colors.grey[700]),
                    ),
                    Text(
                      '${email}',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: sizeHeight <= 700 ? 14.0 : 15.0,
                          color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),
              verticalSpaceLarge,
              Obx(
                () => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0.wp,
                  ),
                  child: TextFormField(
                    controller: resetPassCtrl.resetPassCtrl,
                    obscureText: resetPassCtrl.obscureTextOne.value,
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
                              resetPassCtrl.obscureTextOne.value =
                                  !resetPassCtrl.obscureTextOne.value;
                            } catch (exception) {
                              print(exception);
                            }
                          },
                          child: Icon(
                            resetPassCtrl.obscureTextOne.value
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
                        return "*Please enter password";
                      } else if (value.length < 8) {
                        return "8 characters, 1 uppercase, 1 lowercase and 1 number required.";
                      } else if (value.length > 8 || value.length == 8) {
                        var returnString;
                        if (!RegExp(
                                r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,32}$')
                            .hasMatch(value)) {
                          returnString =
                              "8 characters, 1 uppercase, 1 lowercase and 1 number required.";
                        } else {
                          resetPassCtrl.newPassword = value;
                          returnString = null;
                        }
                        return returnString;
                      } else {
                        resetPassCtrl.newPassword = value;
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
                    controller: resetPassCtrl.confirmPassCtrl,
                    obscureText: resetPassCtrl.obscureTextTwo.value,
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
                              resetPassCtrl.obscureTextTwo.value =
                                  !resetPassCtrl.obscureTextTwo.value;
                            } catch (exception) {
                              print(exception);
                            }
                          },
                          child: Icon(
                            resetPassCtrl.obscureTextTwo.value
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
                        return "*Please enter password";
                      } else if (value != resetPassCtrl.newPassword) {
                        return "*Password don't match";
                      } else {
                        resetPassCtrl.newPassword = value;
                        return null;
                      }
                    },
                  ),
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
                        if (resetPassCtrl.forgotKey.currentState!.validate()) {
                          Get.to(LoginView());
                        }
                      } catch (exception) {
                        print(exception);
                      }
                    },
                    child: Text(
                      'Reset',
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
