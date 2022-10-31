import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      title: 'Project Management Tool',
      debugShowCheckedModeBanner: false,
      home: WalkthroughView(),
      builder: EasyLoading.init(),
    );
  }
}
