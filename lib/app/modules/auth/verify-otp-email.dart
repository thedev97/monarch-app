import 'package:flutter_sms_autofill/flutter_sms_autofill.dart';
import 'package:get/get.dart';
import '../../core/commons.dart';
import '../../core/values/colors.dart';
import '../../core/values/sizes.dart';
import 'package:flutter/material.dart';
import '../../core/values/images.dart';
import '../../core/values/strings.dart';
import '../../core/Utils/custom-painter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/navigation/back_button.dart';
import '../../widgets/buttons/primary_buttons.dart';
import '../../controllers/auth/email-send-otp.dart';
import 'package:Monarch/app/core/values/values.dart';
import '../../controllers/auth/verify-email-otp.dart';
import 'package:timer_count_down/timer_count_down.dart';

class VerifyEmailOTP extends StatelessWidget {
  String email;

  VerifyEmailOTP({Key? key, required this.email}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaKey = GlobalKey<ScaffoldState>();

  VerifyEmailOTPController verifyEmailOTPController =
      Get.put(VerifyEmailOTPController());

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
            verifyOTPContainer(),
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
    return Text(verifyOTP_title,
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
    return Text("$verifyOTP_subtitle $email",
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.black.withOpacity(0.8)));
  }

  Widget verifyOTPContainer() {
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
                    otpTextField(),
                    verticalSpaceMedium,
                    Obx(
                      () => verifyEmailOTPController.loading.value
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
                                  buttonText: verify_button,
                                  callback: () => verifyEmailOTPController
                                      .verifyOTPApi(email),
                                ),
                              ),
                            ),
                    ),
                    verticalSpaceRegular,
                    countDownPart(),
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

  Widget otpTextField() {
    return Obx(
      () => PinFieldAutoFill(
        codeLength: 4,
        textInputAction: TextInputAction.done,
        controller: verifyEmailOTPController.otpController,
        decoration: UnderlineDecoration(
          textStyle: AppTextStyles.normalText,
          colorBuilder: const FixedColorBuilder(
            Colors.transparent,
          ),
          bgColorBuilder: FixedColorBuilder(
            Colors.blueGrey.withOpacity(0.2),
          ),
          gapSpace: 20.0,
        ),
        currentCode: verifyEmailOTPController.messageOTPCode.value,
        onCodeSubmitted: (code) {},
        onCodeChanged: (code) {
          verifyEmailOTPController.messageOTPCode.value = code!;
          verifyEmailOTPController.countdownController.pause();
        },
      ),
    );
  }

  Widget countDownPart() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Countdown(
        controller: verifyEmailOTPController.countdownController,
        seconds: 15,
        interval: const Duration(milliseconds: 1000),
        build: (context, currentRemainingTime) {
          if (currentRemainingTime == 0.0) {
            return Align(
              alignment: Alignment.bottomRight,
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () => emailSendOTPController.emailSendOTPApi(),
                  child: Text(
                    resend_button,
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.5,
                        decoration: TextDecoration.underline,
                        shadows: [
                          Shadow(
                              color: Colors.black,
                              offset: Offset(0.0, 0.5),
                              blurRadius: 0.5),
                        ],
                        color: orange),
                  ),
                ),
              ),
            );
          } else {
            return Text(
                "This code is expired on "
                "${currentRemainingTime.toString().length == 4 ? " "
                    "${currentRemainingTime.toString().substring(0, 2)}" : " "
                    "${currentRemainingTime.toString().substring(0, 1)}"}",
                style: AppTextStyles.highlightText2);
          }
        },
      ),
    );
  }
}
