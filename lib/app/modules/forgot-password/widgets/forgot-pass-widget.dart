import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_management_tool/app/core/commons.dart';
import 'package:project_management_tool/app/core/utils/extension.dart';
import 'package:project_management_tool/app/core/utils/snackbar.dart';
import 'package:project_management_tool/app/core/values/colors.dart';
import 'package:project_management_tool/app/core/values/icons.dart';
import 'package:project_management_tool/app/core/values/images.dart';
import 'package:project_management_tool/app/modules/forgot-password/controller.dart';
import 'package:project_management_tool/app/modules/reset-password/view.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final forgotPassCtrl = Get.find<ForgotPasswordController>();

  ForgotPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Form(
          key: forgotPassCtrl.formKey,
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
                        forgotPassCtrl.emailCtrl.clear(),
                          });
                    },
                    icon: Icon(
                      backIcon,
                      color: Colors.black,
                    )),
              ),
              Center(
                child: Text(
                  'Forgot Password',
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
                      'Enter the email address associated',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: sizeHeight <= 700 ? 14.0 : 15.0,
                          color: Colors.grey[700]),
                    ),
                    Text(
                      'with this account',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: sizeHeight <= 700 ? 14.0 : 15.0,
                          color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              Center(
                child: SvgPicture.asset(
                  forgotPassImg,
                  width: sizeWidth * 0.45,
                  height:
                      sizeHeight <= 700 ? sizeHeight * 0.38 : sizeHeight * 0.42,
                ),
              ),
              verticalSpaceLarge,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
                child: TextFormField(
                  controller: forgotPassCtrl.emailCtrl,
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
                      return "*Please enter your existing email";
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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sizeWidth * 0.25,
                ),
                child: SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      try {
                        if (forgotPassCtrl.formKey.currentState!.validate()) {
                          Future.delayed(const Duration(microseconds: 50), () {
                            emailVerifyBottomSheet(context);
                          });
                        }
                      } catch (exception) {
                        print(exception);
                      }
                    },
                    child: Text(
                      'Send',
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

  //?? email verify bottom sheet
  emailVerifyBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => emailVerifyBuildSheet(context));
  }

  //?? email verify build sheet
  Widget emailVerifyBuildSheet(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.4,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              )),
          child: ListView(
              controller: controller,
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.only(
                  left: 0.0, right: 0.0, top: 20.0, bottom: 20.0),
              children: [
                Center(
                  child: Container(
                      width: 55,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primaryColor,
                      )),
                ),
                verticalSpaceMedium,
                Center(
                  child: Text(
                    'Verify the OTP',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: sizeHeight <= 700 ? 20.0 : 20.0,
                        color: Colors.black),
                  ),
                ),
                verticalSpaceSmall,
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Enter the 4 digit OTP sent to',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: sizeHeight <= 700 ? 14.0 : 15.0,
                            color: Colors.grey[800]),
                      ),
                      verticalSpaceTiny,
                      Text(
                        '${forgotPassCtrl.emailCtrl.text}',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: sizeHeight <= 700 ? 14.0 : 15.0,
                            color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ),
                verticalSpaceLarge,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
                  child: TextFormField(
                    controller: forgotPassCtrl.otpCtrl,
                    keyboardType: TextInputType.number,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                        color: Colors.black),
                    maxLength: 4,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 15.0),
                        child: Icon(
                          otpIcon,
                          color: Colors.grey[600],
                        ), // Change this icon as per your requirement
                      ),
                      prefixIconConstraints: BoxConstraints(minWidth: 2.0),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      hintText: "Enter OTP",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: Colors.grey),
                    ),
                    autofocus: false,
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
                          if (forgotPassCtrl.otpCtrl.text.isEmpty != true) {
                            Navigator.pop(context);
                            Future.delayed(const Duration(microseconds: 50),
                                () {
                              Get.to(ResetPasswordView(email: forgotPassCtrl.emailCtrl.text,));
                            });
                          } else {
                            showSnackbar(context,
                                type: SnackbarType.error,
                                message: '*Please enter valid OTP');
                          }
                        } catch (exception) {
                          print(exception);
                        }
                      },
                      child: Text(
                        'Verify',
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
              ]),
        ),
      ),
    );
  }
}
