import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/colors.dart';
import '../../core/values/images.dart';
import '../../core/values/sizes.dart';
import '../../core/values/strings.dart';
import '../../core/values/values.dart';
import '../../data/data_model.dart';
import '../../widgets/dummy/profile_dummy_img.dart';
import '../../widgets/notification/notification_card.dart';
import 'package:Monarch/app/widgets/navigation/default_back_button.dart';

import '../profile/profile_overview.dart';

class NotificationScreen extends StatelessWidget {
  final int count;

  const NotificationScreen({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: SafeArea(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [DefaultBack(), profileImg()],
            ),
            notificationHeader(),
            notificationListSection(),
          ],
        ),
      ),
    );
  }

  Widget profileImg() {
    return InkWell(
      onTap: () => Get.to(() => ProfileOverview()),
      child: Padding(
        padding: EdgeInsets.only(right: 20),
        child: ProfileDummyImg(
            color: HexColor.fromHex("93F0F0"),
            dummyType: ProfileDummyTypeImg.Image,
            image: profile_img,
            scale: 1),
      ),
    );
  }

  Widget notificationHeader() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Stack(
              children: [
                Text(notificationTxt, style: AppTextStyles.screenHeader),
                Padding(
                  padding: EdgeInsets.only(left: sizeWidth * 0.29),
                  child: Container(
                    height: 14,
                    width: 14,
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: primaryColor),
                    alignment: Alignment.center,
                    child: Text(notificationCount.toString(),
                        style: AppTextStyles.count),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(viewAllTxt, style: AppTextStyles.viewAll),
          ),
        ],
      ),
    );
  }

  Widget notificationListSection() {
    final dynamic notificationData = AppData.notificationMentions;
    List<Widget> notificationCards = List.generate(
        notificationData.length,
        (index) => NotificationCard(
              read: notificationData[index]['read'],
              userName: notificationData[index]['mentionedBy'],
              time: notificationData[index]['date'],
              image: notificationData[index]['profileImage'],
              message: notificationData[index]['message'],
              imageBackground: notificationData[index]['color'],
            ));
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.15),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0)),
        child: Container(
          height: sizeHeight,
          width: sizeWidth,
          decoration: BoxDecoration(color: primaryColor),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: sizeHeight * 0.25),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0)),
                  child: Container(
                    height: sizeHeight,
                    width: sizeWidth,
                    decoration: BoxDecoration(color: white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35, right: 0, top: 20),
                child: ListView(
                    children: [...notificationCards]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
