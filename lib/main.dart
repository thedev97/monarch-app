import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management_tool/app/data/root-binding/root-binding.dart';
import 'app/modules/walkthrough/walkthrough.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task File (Work management tool)',
      debugShowCheckedModeBanner: false,
      home: WalkthroughView(),
      initialBinding: RootBinding(),
      builder: EasyLoading.init(),
    );
  }
}
