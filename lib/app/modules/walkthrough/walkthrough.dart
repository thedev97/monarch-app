import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_management_tool/app/core/commons.dart';
import 'package:project_management_tool/app/core/values/images.dart';
import 'package:project_management_tool/app/modules/login/login.dart';

class WalkthroughView extends StatelessWidget {
  const WalkthroughView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          verticalSpaceMedium,
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20, left: 15),
            child: SvgPicture.asset(
              workToolImg,
              alignment: Alignment.topLeft,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              'Manage your \nteam & everything\nwith your ways.',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: sizeHeight <= 700 ? 30.0 : 38.0,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 25),
            child: SvgPicture.asset(
              teamWorkImg,
              alignment: Alignment.center,
              width: sizeWidth * 0.45,
              height: sizeHeight <= 700 ? sizeHeight * 0.35 : sizeHeight * 0.4,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Text(
              '1. Easily manage any team and project.'
              '\n2. Customize your workflow.'
              '\n3. Plan, organize and track in one tool.',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                  height: 1.5,
                  color: Colors.grey[600]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: sizeWidth * 0.2, vertical: 20),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              try {
                Future.delayed(const Duration(microseconds: 50), () {
                  Get.to(LoginView());
                });
              } catch (exception) {
                print(exception);
              }
            },
            child: Text(
              'Get Started',
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
    );
  }
}
