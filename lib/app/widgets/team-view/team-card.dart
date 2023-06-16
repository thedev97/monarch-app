import 'package:Monarch/app/core/values/values.dart';
import 'package:flutter/material.dart';
import '../../core/values/images.dart';
import '../dummy/profile_dummy_img.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({
    Key? key,
    required this.empName,
    required this.profileImage,
    required this.empCode,
    required this.contactNum,
  }) : super(key: key);

  final String empName;
  final String profileImage;
  final String empCode;
  final String contactNum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileDummyImg(
              color: Colors.white,
              dummyType: ProfileDummyTypeImg.Image,
              scale: 0.7,
              image: profileImage),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(empName, style: AppTextStyles.subHeader6),
              AppSpaces.verticalSpace5,
              Text(empCode, style: AppTextStyles.subHeader6),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                mobile_img,
                height: 20,
                width: 20,
              ),
              AppSpaces.horizontalSpace10,
              Text(contactNum, style: AppTextStyles.subHeader6),
            ],
          )
        ],
      ),
    );
  }
}
