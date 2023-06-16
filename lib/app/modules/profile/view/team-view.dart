import 'package:flutter/material.dart';
import 'package:grouped_buttons_ns/grouped_buttons_ns.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/sizes.dart';
import '../../../core/values/strings.dart';
import '../../../core/values/values.dart';
import '../../../data/data_model.dart';
import '../../../widgets/team-view/team-card.dart';

class TeamView extends StatefulWidget {
  const TeamView({Key? key}) : super(key: key);

  @override
  State<TeamView> createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {
  bool isSelectedProject = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
          child: Text(myTeams, style: AppTextStyles.header4),
        ),
        AppSpaces.verticalSpace10,
        myProjectData(),
        isSelectedProject == true ? projectList() : Container(),
        AppSpaces.verticalSpace10,
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(directReport, style: AppTextStyles.header4),
        ),
        AppSpaces.verticalSpace20,
        reportList(),
        AppSpaces.verticalSpace10,
      ],
    );
  }

  Widget myProjectData(){
    return RadioButtonGroup(
        labelStyle: AppTextStyles.header6,
        activeColor: primaryColor,
        labels: <String>[
          myProject
        ],
        onSelected: (String selected){
          setState(() {
            isSelectedProject = !isSelectedProject;
          });
        }
    );
  }

  Widget projectList() {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: RadioButtonGroup(
          labels: AppData.myProjectList,
          labelStyle: AppTextStyles.header6,
          activeColor: primaryColor,
          onSelected: (String selected) {
            print(selected);
          }),
    );
  }

  Widget reportList() {
    final dynamic reportingListData = AppData.directReportList;
    var reportingList = List.generate(
      AppData.directReportList.length,
          (index) {
        return TeamCard(
          empName: reportingListData[index]['empName'],
          profileImage: reportingListData[index]['profileImage'],
          empCode: reportingListData[index]['empCode'],
          contactNum: reportingListData[index]['contactNum'],
        );
      },
    );
    return Wrap(children: [...reportingList]);
  }
}
