import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/data/services/storage/services.dart';
import 'app/modules/walkthrough/walkthrough.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async{
  //?? Instantiate GetStorage to access storage driver apis
  await GetStorage.init();
  //?? async version of Get.put().
  // Awaits for the resolution of the Future from builder()parameter
  // and stores the Instance returned
  await Get.putAsync(() => StorageService().init());
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
