import 'package:get/get.dart';
import '../../controllers/auth/email-send-otp.dart';
import '../../core/Utils/custom-painter.dart';
import '../../core/commons.dart';
import 'package:flutter/material.dart';
import '../../core/values/images.dart';
import '../../core/values/sizes.dart';
import '../../core/values/strings.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/buttons/primary_buttons.dart';
import '../../widgets/forms/text_input_with _label.dart';
import '../../widgets/navigation/back_button.dart';

class EmailSendOTP extends StatelessWidget {
  EmailSendOTP({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaKey = GlobalKey<ScaffoldState>();

  EmailSendOTPController emailSendOTPController =
      Get.put(EmailSendOTPController());

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
            emailSendContainer(),
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

  Widget backgroundPainter() {
    return CustomPaint(
      painter: Painter(),
      child: Container(),
    );
  }

  Widget titleTxt() {
    return Text(forgotPass_title,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            shadows: [
              Shadow(
                  color: Colors.black,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 1.0),
            ],
            color: Colors.black));
  }

  Widget subTitleTxt() {
    return Text(login_sub_title,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.black.withOpacity(0.8)));
  }

  Widget emailSendContainer() {
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
              padding: EdgeInsets.only(
                  left: 15.0, top: 40.0, right: 15.0, bottom: 10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpaceMedium,
                    titleTxt(),
                    verticalSpaceSmall,
                    subTitleTxt(),
                    verticalSpaceRegular,
                    TextFormInput(
                      placeholder: "Email",
                      keyboardType: "text",
                      controller: emailSendOTPController.emailController.value,
                      obscureText: emailSendOTPController.obscureText.value,
                      label: "Your Email",
                      validatorFunction: (String? val) {
                        if (val!.isEmpty == true) {
                          return emailEmptyErrorMsg;
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpaceMedium,
                    Obx(
                      () => emailSendOTPController.loading.value
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
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: AppPrimaryButton(
                                  buttonHeight: 40,
                                  buttonWidth: sizeWidth * 0.35,
                                  buttonText: send_button,
                                  callback: () =>
                                      emailSendOTPController.emailSendOTPApi(),
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
