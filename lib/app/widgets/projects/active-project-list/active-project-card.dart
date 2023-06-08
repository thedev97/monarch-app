import 'package:Monarch/app/core/values/values.dart';
import 'package:flutter/material.dart';
import '../../../core/values/colors.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.projectName,
    required this.progressValue,
    required this.backgroundColor,
    required this.isActive,
    required this.desc,
    required this.time,
  }) : super(key: key);

  final String projectName;
  final double progressValue;
  final String backgroundColor;
  final String time;
  final bool isActive;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isActive == true ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.black.withOpacity(0.8), width: 1)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpaces.verticalSpace10,
            circularProgress(),
           SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(projectName,
                    style: isActive == true
                        ? AppTextStyles.chatMsgOne
                        : AppTextStyles.chatMsgTwo),
                Text(time,
                    style: isActive == true
                        ? AppTextStyles.subHeader1
                        : AppTextStyles.subHeader4),
              ],
            ),
            AppSpaces.verticalSpace10,
            Text(desc,
                style: isActive == true
                    ? AppTextStyles.subHeader1
                    : AppTextStyles.subHeader4),
            AppSpaces.verticalSpace10,
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.arrow_forward_outlined,
                color: isActive == true
                    ? Colors.white.withOpacity(0.8)
                    : Colors.black.withOpacity(0.8),
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget circularProgress() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 8),
      child: SizedBox(
        height: 10,
        width: 10,
        child: CircularProgressIndicator(
          value: progressValue,
          strokeWidth: 30,
          color: isActive == true ? Colors.white : primaryColor,
          backgroundColor: isActive == true ? Colors.grey.shade400 : Colors.white,
        ),
      ),
    );
  }
}
