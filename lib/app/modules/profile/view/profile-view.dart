import 'package:Monarch/app/core/values/sizes.dart';
import 'package:Monarch/app/widgets/dialog/dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/strings.dart';
import '../../../core/values/values.dart';
import 'package:Monarch/app/widgets/buttons/primary_buttons.dart';
import '../../../widgets/forms/password_text_input.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isResetPassword = false;
  bool isLogout = false;
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(designationTxt, style: AppTextStyles.subHeader2),
          AppSpaces.verticalSpace5,
          Text(designationVal, style: AppTextStyles.header4),
          AppSpaces.verticalSpace10,
          Text(empIdTxt, style: AppTextStyles.subHeader2),
          AppSpaces.verticalSpace5,
          Text(empIDVal, style: AppTextStyles.header4),
          AppSpaces.verticalSpace10,
          Text(mobileTxt, style: AppTextStyles.subHeader2),
          AppSpaces.verticalSpace5,
          Text(mobileVal, style: AppTextStyles.header4),
          AppSpaces.verticalSpace10,
          Text(emailTxt, style: AppTextStyles.subHeader2),
          AppSpaces.verticalSpace5,
          Text(userMail, style: AppTextStyles.header4),
          AppSpaces.verticalSpace10,
          Text(locationTxt, style: AppTextStyles.subHeader2),
          AppSpaces.verticalSpace5,
          Text(locationVal, style: AppTextStyles.header4),
          AppSpaces.verticalSpace10,
          Text(reportingTxt, style: AppTextStyles.subHeader2),
          AppSpaces.verticalSpace5,
          Text(reportingUserTxt, style: AppTextStyles.header4),
          AppSpaces.verticalSpace20,
          Text(inviteSecTxt, style: AppTextStyles.subHeader2),
          AppSpaces.verticalSpace5,
          Row(
            children: [
              Text(inviteMemTxt, style: AppTextStyles.header4),
              AppSpaces.horizontalSpace8,
              AppPrimaryButton(
                  buttonText: inviteBttnTxt,
                  buttonHeight: 25,
                  buttonWidth: sizeWidth * 0.18)
            ],
          ),
          AppSpaces.verticalSpace15,
          GestureDetector(
              onTap: () {
                setState(() {
                  isResetPassword = true;
                });

                Future.delayed(Duration(milliseconds: 200), () async {
                  resetPasswordDialog(context);
                });
              },
              child: Text(resetPassBttnTxt, style: AppTextStyles.chatMsgTwo)),
          AppSpaces.verticalSpace20,
          GestureDetector(
              onTap: () {
                setState(() {
                  isLogout = true;
                });
                Future.delayed(Duration(milliseconds: 200), () async {
                  logoutDialog(context);
                });
              },
              child: Text(logoutBttnTxt, style: AppTextStyles.chatMsgTwo)),
          AppSpaces.verticalSpace15,
        ],
      ),
    );
  }

  // Show Dialog For Reset Password
  Future resetPasswordDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: whiteColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  resetPasswordTxt,
                                  style: AppTextStyles.header,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  try {
                                    Get.back();
                                  } catch (exception) {
                                    print(exception);
                                  }
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  child: Icon(
                                    Icons.close_sharp,
                                    size: 15.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AppSpaces.verticalSpace10,
                          passwordTextField(),
                          AppSpaces.verticalSpace20,
                          confirmPasswordFiled(),
                          AppSpaces.verticalSpace30,
                          updatePassword(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }

  Widget passwordTextField() {
    return PasswordInputField(
      controller: _passwordController,
      obscureText: _obscureText1,
      textCapitalization: TextCapitalization.none,
      keyBoardType: TextInputType.text,
      suffixIcon: _obscureText1
          ? GestureDetector(
              onTap: () async {
                try {
                  setState(() {
                    _obscureText1 = !_obscureText1;
                  });
                } catch (exception) {
                  print(exception);
                }
              },
              child: Icon(
                FontAwesomeIcons.eyeSlash,
                size: 15.0,
                color: HexColor.fromHex("3C3E49"),
              ))
          : GestureDetector(
              onTap: () async {
                try {
                  setState(() {
                    _obscureText1 = !_obscureText1;
                  });
                } catch (exception) {
                  print(exception);
                }
              },
              child: Icon(
                FontAwesomeIcons.eye,
                size: 15.0,
                color: HexColor.fromHex("3C3E49"),
              )),
      hintText: 'Password',
      autoFocus: false,
    );
  }

  Widget confirmPasswordFiled() {
    return PasswordInputField(
      controller: _confirmController,
      obscureText: _obscureText2,
      textCapitalization: TextCapitalization.none,
      keyBoardType: TextInputType.text,
      suffixIcon: _obscureText2
          ? GestureDetector(
              onTap: () async {
                try {
                  setState(() {
                    _obscureText2 = !_obscureText2;
                  });
                } catch (exception) {
                  print(exception);
                }
              },
              child: Icon(
                FontAwesomeIcons.eyeSlash,
                size: 15.0,
                color: HexColor.fromHex("3C3E49"),
              ))
          : GestureDetector(
              onTap: () async {
                try {
                  setState(() {
                    _obscureText2 = !_obscureText2;
                  });
                } catch (exception) {
                  print(exception);
                }
              },
              child: Icon(
                FontAwesomeIcons.eye,
                size: 15.0,
                color: HexColor.fromHex("3C3E49"),
              )),
      hintText: 'Confirm Password',
      autoFocus: false,
    );
  }

  Widget updatePassword() {
    return AppPrimaryButton(
        buttonText: updatePasswordTxt,
        buttonHeight: 40,
        buttonWidth: sizeWidth * 0.45);
  }

  // Show Dialog For Logout
  Future logoutDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext logoutAlertContext) {
          return CustomDialog(
            title: logoutBttnTxt,
            subtitle: logoutSubTxt,
            cancelButtonText: cancelButtonText,
            mainButtonText: mainButtonText,
          );
        });
  }
}
