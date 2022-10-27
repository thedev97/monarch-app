import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_management_tool/app/core/commons.dart';
import 'package:project_management_tool/app/core/values/images.dart';
import 'package:project_management_tool/app/core/values/values.dart';
import 'package:project_management_tool/app/modules/auth/email_address.dart';

class WalkthroughView extends StatelessWidget {
  const WalkthroughView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff8eee4),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            verticalSpaceLarge,
            verticalSpaceSmall,
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Manage your \nteam & everything\nwith your ways.',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: sizeHeight <= 700 ? 30.0 : 38.0,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 1.0),
                    ],
                    color: Colors.black),
              ),
            ),
            verticalSpaceMedium,
            SvgPicture.asset(
              teamWorkImg,
              height: sizeHeight <= 700 ? sizeHeight * 0.42 : sizeHeight * 0.5,
            ),
            verticalSpaceTiny,
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                '1. Easily manage any team and project.'
                '\n2. Customize your workflow.'
                '\n3. Plan, organize and track in one tool.',
                style: GoogleFonts.lato(
                    fontSize: 14,
                    height: 1.5,
                    color: HexColor.fromHex("3C3E49")),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: sizeWidth * 0.1, vertical: 20),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              try {
                Future.delayed(const Duration(microseconds: 20), () {
                  Get.to(EmailAddressScreen());
                });
              } catch (exception) {
                print(exception);
              }
            },
            child: Text(
              'Get Started',
              style: GoogleFonts.lato(
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 1.0),
                  ],
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Colors.white),
            ),
            style: ButtonStyles.blueRounded,
          ),
        ),
      ),
    );
  }
}
