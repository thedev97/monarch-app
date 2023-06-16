import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/values/images.dart';
import '../../../core/values/sizes.dart';
import '../../../core/values/strings.dart';
import '../../../core/values/values.dart';
import '../../../data/data_model.dart';
import '../../../widgets/calendar/calendar-view.dart';
import '../../../widgets/navigation/dasboard_nav.dart';
import '../../chats/chat_screen.dart';
import '../../notification/notifications.dart';
import 'package:Monarch/app/core/values/colors.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import '../../../widgets/projects/active-project-list/active-project-card.dart';
import '../../profile/profile_overview.dart';


class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(children: [
              dashboardNav(),
              calendarList(),
              membersText(),
              membersList(),
              projectList()
            ]),
          ),
        ));
  }

  Widget dashboardNav() {
    return DashboardNav(
      chatImg: chat_img,
      notifyImg: notify_img,
      image: profile_img,
      notificationCount: notificationCount,
      chatCount: chatCount,
      title: todayTxt,
      subTitle: todayDate,
      onImageTapped: () {
        Get.to(() => ProfileOverview());
      },
      notificationPage: NotificationScreen(
        count: notificationCount,
      ),
      chatPage: ChatScreen(),
    );
  }

  Widget calendarList() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.08),
      child: HorizontalCalendar(
        date: DateTime.now(),
        textColor: Colors.black,
        backgroundColor: Colors.transparent,
        selectedColor: primaryColor,
        showMonth: true,
        initialDate: DateTime.now(),
        onDateSelected: (date) {
          print(date.toString());
        },
      ),
    );
  }

  Widget membersText() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.25),
      child: Text(membersTxt,
          style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              shadows: [
                Shadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 1.0),
              ],
              color: Colors.black)),
    );
  }

  Widget membersList() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.28),
      child: Transform.scale(
          alignment: Alignment.centerLeft,
          scale: 0.65,
          child: buildStackedImages()),
    );
  }

  Widget projectList() {
    final dynamic projectListData = AppData.activeProjectList;
    var activeProject = DynamicHeightGridView(
        itemCount: projectListData.length,
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSpacing: 15,
        builder: (ctx, index) => GestureDetector(
              onTap: () {
                setState(() {
                  projectListData[index]['isActive'] =
                      !projectListData[index]['isActive'];
                });
              },
              child: ProjectCard(
                projectName: projectListData[index]['projectName'],
                progressValue: projectListData[index]['progressValue'],
                backgroundColor: projectListData[index]['color'],
                time: projectListData[index]['time'],
                isActive: projectListData[index]['isActive'],
                desc: projectListData[index]['desc'],
              ),
            ));
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.36),
      child: activeProject,
    );
  }
}
