import 'package:Monarch/app/core/values/colors.dart';
import 'package:Monarch/app/core/values/values.dart';
import 'package:flutter/material.dart';

class ALLProjectCard extends StatelessWidget {
  const ALLProjectCard({
    Key? key,
    required this.projectName,
    required this.projectColor,
    required this.onPressed,
    required this.onDeleted,
  }) : super(key: key);

  final String projectName;
  final String projectColor;
  final void Function()? onPressed;
  final void Function()? onDeleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 10),
      child: Container(
        height: 40,

        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.8), width: 1,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: InputChip(
          avatar: CircleAvatar(
            backgroundColor: HexColor.fromHex(projectColor),
            radius: 4,
          ),
          backgroundColor: Colors.transparent,
          label:  Text(projectName,
              style: AppTextStyles.chatMsgTwo),
          onPressed: onPressed,
          deleteIconColor: primaryColor,
          deleteIcon: Icon(
            Icons.cancel,
            size: 15,
          ),
          onDeleted:onDeleted,
        ),
      ),
    );
  }
}
