import 'package:flutter/material.dart';
import 'package:project_management_tool/app/widgets/dummy/profile_dummy_img.dart';
import '../../core/values/values.dart';
import '../../data/data_model.dart';
import '../../widgets/navigation/default_back.dart';
import '../../widgets/notification/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic notificationData = AppData.notificationMentions;

    List<Widget> notificationCards = List.generate(
        notificationData.length,
        (index) => NotificationCard(
              read: notificationData[index]['read'],
              userName: notificationData[index]['mentionedBy'],
              date: notificationData[index]['date'],
              image: notificationData[index]['profileImage'],
              mentioned: notificationData[index]['hashTagPresent'],
              message: notificationData[index]['message'],
              mention: notificationData[index]['mentionedIn'],
              imageBackground: notificationData[index]['color'],
              userOnline: notificationData[index]['userOnline'],
            ));
    return Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AppSpaces.verticalSpace30,
            Text("Notification", style: AppTextStyles.header2),
            AppSpaces.verticalSpace20,
            Expanded(child: ListView(children: [...notificationCards]))
          ]),
        ));
  }
}
