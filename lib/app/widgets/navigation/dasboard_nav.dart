import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Monarch/app/core/values/colors.dart';
import 'package:Monarch/app/widgets/dummy/profile_dummy_img.dart';
import '../../core/values/values.dart';

class DashboardNav extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final String chatImg;
  final String notifyImg;
  final StatelessWidget? notificationPage;
  final StatefulWidget? chatPage;
  final VoidCallback? onImageTapped;
  final int notificationCount;
  final int chatCount;

  DashboardNav(
      {Key? key,
      required this.title,
      required this.chatImg,
      required this.notifyImg,
      required this.image,
      required this.notificationCount,
      required this.chatCount,
      this.notificationPage,
      this.chatPage,
      this.onImageTapped,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(this.title, style: AppTextStyles.header),
              SizedBox(
                height: 5,
              ),
              Text(this.subTitle, style: AppTextStyles.subHeader),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            InkWell(
              onTap: () {
                if (notificationPage != null) Get.to(() => notificationPage!);
              },
              child: Stack(children: <Widget>[
                Image.asset(
                  notifyImg,
                  height: 30,
                  width: 30,
                ),
                Positioned(
                  // draw a red marble
                  top: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: primaryColor),
                    alignment: Alignment.center,
                    child: Text(notificationCount.toString(),
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            shadows: [
                              Shadow(
                                  color: Colors.black,
                                  offset: Offset(0.0, 0.4),
                                  blurRadius: 0.4),
                            ],
                            color: Colors.white)),
                  ),
                )
              ]),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () {
                if (chatPage != null) Get.to(() => chatPage!);
              },
              child: Stack(children: <Widget>[
                Image.asset(
                  chatImg,
                  height: 30,
                  width: 30,
                ),
                Positioned(
                  // draw a red marble
                  top: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: primaryColor),
                    alignment: Alignment.center,
                    child: Text(chatCount.toString(),
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            shadows: [
                              Shadow(
                                  color: Colors.black,
                                  offset: Offset(0.0, 0.4),
                                  blurRadius: 0.4),
                            ],
                            color: Colors.white)),
                  ),
                )
              ]),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: onImageTapped,
              child: ProfileDummyImg(
                  color: HexColor.fromHex("93F0F0"),
                  dummyType: ProfileDummyTypeImg.Image,
                  image: this.image,
                  scale: 1),
            )
          ])
        ]);
  }
}
