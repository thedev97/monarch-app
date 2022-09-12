import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management_tool/app/modules/home/home-controller.dart';

class HomeWidgets extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  GlobalKey<FormState> _homeKey = GlobalKey<FormState>();

  HomeWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Form(
          key: _homeKey,
          child: ListView(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [],
          )),
    );
  }
}
