import 'package:get/get.dart';
import '../../core/values/images.dart';
import 'dashboard.dart';
import '../../core/constants.dart';
import 'package:flutter/material.dart';
import 'package:Monarch/app/core/values/colors.dart';
import '../../widgets/dashboard/bottomNavigationItem.dart';
import 'package:Monarch/app/modules/task/create-task-screen.dart';

class Timeline extends StatefulWidget {
  String token;
  Timeline({Key? key, required this.token}) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  ValueNotifier<int> bottomNavigatorTrigger = ValueNotifier(0);

  StatelessWidget currentScreen = Dashboard();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          ValueListenableBuilder(
              valueListenable: bottomNavigatorTrigger,
              builder: (BuildContext context, _, __) {
                return PageStorage(
                    child: screens[bottomNavigatorTrigger.value],
                    bucket: bucket);
              })
        ]),
        floatingActionButton: new FloatingActionButton(
          backgroundColor: primaryColor,
          child: new Icon(Icons.add),
          mini: true,
          elevation: 2.0,
          onPressed: () => Get.to(() => CreateTask()),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          height: 50,
          child: BottomAppBar(
            notchMargin: 5.0,
            elevation: 5,
            shape: CircularNotchedRectangle(),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 10,
              ),
              BottomNavigationItem(
                  itemIndex: 0,
                  notifier: bottomNavigatorTrigger,
                  image: home_select_img),
              Spacer(),
              BottomNavigationItem(
                  itemIndex: 1,
                  notifier: bottomNavigatorTrigger,
                  image: project_select_img),
              Spacer(),
              Spacer(),
              BottomNavigationItem(
                  itemIndex: 2,
                  notifier: bottomNavigatorTrigger,
                  image: calendar_select_img),
              Spacer(),
              BottomNavigationItem(
                  itemIndex: 3,
                  notifier: bottomNavigatorTrigger,
                  image: task_select_img),
              SizedBox(
                width: 10,
              ),
            ]),
          ),
        ));
  }
}
