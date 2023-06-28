import 'package:Monarch/app/modules/task/update_task.dart';
import 'package:Monarch/app/widgets/tasks/task-list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/images.dart';
import '../../../core/values/sizes.dart';
import '../../../core/values/strings.dart';
import '../../../core/values/values.dart';
import '../../../data/data_model.dart';
import '../../../widgets/forms/search_box_form.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TextEditingController _searchController = new TextEditingController();
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(children: [
              taskHeaderSection(),
              isSearch == true ? searchSection() : Container(),
              taskListSection()
            ]),
          ),
        ));
  }

  Widget taskHeaderSection() {
    return Container(
      height: 50,
      width: sizeWidth,
      decoration: BoxDecoration(
          color: chatHeaderColor,
          border: Border.all(color: Colors.grey.shade200, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15,
          ),
          Text(
            taskList,
            style: AppTextStyles.header3,
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: InkWell(
                onTap: () {
                  setState(() {
                    isSearch = !isSearch;
                  });
                },
                child: Image.asset(search_img, width: 20, height: 20)),
          ),
        ],
      ),
    );
  }

  Widget searchSection() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.08),
      child: Container(
        height: 50,
        width: sizeWidth,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: SearchBoxInput(
            placeholder: searchPlaceHolderTxt, controller: _searchController),
      ),
    );
  }

  Widget taskListSection() {
    final dynamic taskData = AppData.taskList;
    List<Widget> chatUser = List.generate(
        taskData.length,
        (index) => InkWell(
              onTap: () => Get.to(() => UpdateTask()),
              child: TaskCard(
                userName: taskData[index]['name'],
                time: taskData[index]['time'],
                image: taskData[index]['taskImage'],
                isActive: taskData[index]['isActive'],
                lastMsg: taskData[index]['message'],
                status: taskData[index]['status'],
                project: taskData[index]['project'],
              ),
            ));
    return Padding(
      padding: EdgeInsets.only(
          top: isSearch == false ? sizeHeight * 0.08 : sizeHeight * 0.15),
      child: ListView(children: [...chatUser]),
    );
  }
}
