import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/values.dart';
import '../../data/data_model.dart';
import '../../widgets/employee-card/employee_card.dart';
import '../../widgets/forms/search_box_form.dart';
import '../../widgets/navigation/back.dart';

class SetAssigneesScreen extends StatelessWidget {
  TextEditingController _searchController = new TextEditingController();

  SetAssigneesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic data = AppData.employeeData;
    var sizeHeight = Get.height;
    List<Widget> cards = List.generate(
        AppData.employeeData.length,
        (index) => EmployeeCard(
              activated: data[index]['activated'],
              employeeImage: data[index]['employeeImage'],
              employeeName: data[index]['employeeName'],
              backgroundColor: data[index]["color"],
              employeePosition: data[index]["employeePosition"],
            ));
    return Scaffold(
        backgroundColor: Color(0xff202427),
        body: SafeArea(
          child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 25),
              child: NavigationBack(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: sizeHeight*0.12),
              child: Text("Set New Assignees", style: AppTextStyles.header2),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: sizeHeight*0.18),
              child: SearchBoxInput(placeholder: 'Search', controller: _searchController),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: sizeHeight*0.27),
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  ...cards,
                ]),
              ),
            ),
          ]),
        ));
  }
}
