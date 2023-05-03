import 'package:get/get.dart';
import '../auth/email_address.dart';
import '../../core/values/colors.dart';
import '../../core/values/sizes.dart';
import '../../core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/buttons/splash_screen_buttons.dart';
import 'package:project_management_tool/app/core/commons.dart';
import 'package:project_management_tool/app/core/values/images.dart';

class WalkthroughView extends StatelessWidget {
  const WalkthroughView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: sizeHeight,
          width: sizeWidth,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [splashLinearColorOne, splashLinearColorTwo],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpaceMedium,
              titleTxt(),
              verticalSpaceExtraLarge,
              Image.asset(
                splashImg,
                height: sizeHeight * 0.45,
              ),
              verticalSpaceExtraLarge,
              getStartedButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleTxt() {
    return Text(walk_through_title,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            fontSize: 28,
            shadows: [
              Shadow(
                  color: Colors.black,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 1.0),
            ],
            color: Colors.white));
  }

  Widget buttonTxt() {
    return Text(get_started,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            shadows: [
              Shadow(
                  color: Colors.black,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 1.0),
            ],
            color: Colors.white));
  }

  Widget getStartedButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buttonTxt(),
        SizedBox(
          width: 10,
        ),
        SplashButton(
          buttonHeight: 30,
          buttonWidth: 60,
          callback: () => Get.to(() => EmailAddressScreen()),
        ),
      ],
    );
  }
}
