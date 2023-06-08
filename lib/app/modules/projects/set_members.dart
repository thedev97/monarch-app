import 'package:flutter/material.dart';
import 'package:Monarch/app/widgets/forms/search_box_form.dart';
import '../../core/values/values.dart';
import '../../data/data_model.dart';
import '../../widgets/background/white-background.dart';
import '../../widgets/buttons/primary_buttons.dart';
import '../../widgets/employee-card/employee_card.dart';

class SelectMembersScreen extends StatelessWidget {
  TextEditingController _searchController = new TextEditingController();

  SelectMembersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic data = AppData.employeeData;
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
        body: Stack(children: [
      WhiteBackground(
        color: HexColor.fromHex("#ffffff"),
        position: "topLeft",
      ),
      Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(children: [
            /* Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: TaskezAppHeader(
                title: "Set Assignees",
                widget: AppPrimaryButton(
                  buttonHeight: 40,
                  buttonWidth: 70,
                  buttonText: "Next",
                ),
              ),
            ),*/
            AppSpaces.verticalSpace40,
            Expanded(
                flex: 1,
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecorationStyles.fadingGlory,
                    child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: DecoratedBox(
                            decoration: BoxDecorationStyles.fadingInnerDecor,
                            child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SearchBoxInput(
                                        placeholder: 'Search',
                                        controller: _searchController,
                                      ),
                                      AppSpaces.verticalSpace20,
                                      Expanded(
                                          child: MediaQuery.removePadding(
                                        context: context,
                                        removeTop: true,
                                        child: ListView(children: [...cards]),
                                      ))
                                    ])))))),
            //AppSpaces.verticalSpace20,
            AppPrimaryButton(
                buttonHeight: 50,
                buttonWidth: 150,
                buttonText: "Add Member",
                callback: () {
                  int count = 0;
                  Navigator.of(context).popUntil((_) => count++ >= 2);
                }),
            AppSpaces.verticalSpace20,
          ]))
    ]));
  }
}
