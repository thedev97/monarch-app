import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/values/images.dart';
import '../../../core/values/sizes.dart';
import '../../../core/values/strings.dart';
import '../../../core/values/values.dart';
import '../../../data/data_model.dart';
import '../../../widgets/buttons/circular_button.dart';
import '../../chats/chat_screen.dart';
import '../../notification/notifications.dart';
import '../../../widgets/navigation/dasboard_nav.dart';
import 'package:Monarch/app/modules/projects/create_project.dart';
import '../../../widgets/projects/all-project-list/all-project-list.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
                children: [dashboardNav(), projectText(), allProjectList()]),
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
      title: nameTxt,
      subTitle: pendingTask,
      onImageTapped: () {
        //Get.to(() => ProfileOverview());
      },
      notificationPage: NotificationScreen(
        count: notificationCount,
      ),
      chatPage: ChatScreen(),
    );
  }

  Widget projectText() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(projectTxt,
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
          AppSpaces.horizontalSpace10,
          CircularButton(
              buttonHeight: 30,
              buttonWidth: 30,
              buttonText: cont_button,
              callback: () => Get.to(() => CreateProjectScreen())),
        ],
      ),
    );
  }

  Widget allProjectList() {
    final dynamic allProjectListData = AppData.allProjectList;
    var allProject = List.generate(
      AppData.allProjectList.length,
      (index) {
        return ALLProjectCard(
          projectColor: allProjectListData[index]['color'],
          projectName: allProjectListData[index]['projectName'],
          onPressed: () {
            print("Selected");
          },
          onDeleted: () {
            print("Deleted");
          },
        );
      },
    );
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.15),
      child: Wrap(children: [...allProject]),
    );
  }
}
