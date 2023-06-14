import 'package:Monarch/app/core/values/sizes.dart';
import 'package:flutter/material.dart';
import '../../../core/values/strings.dart';
import '../../../core/values/values.dart';
import 'package:Monarch/app/widgets/buttons/primary_buttons.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(designationTxt, style: AppTextStyles.subHeader2),
          AppSpaces.verticalSpace5,
          Text(designationVal, style: AppTextStyles.header4),
          AppSpaces.verticalSpace10,
          Text(empIdTxt, style: AppTextStyles.subHeader2),
          AppSpaces.verticalSpace5,
          Text(empIDVal, style: AppTextStyles.header4),
          AppSpaces.verticalSpace10,
          Text(mobileTxt, style: AppTextStyles.subHeader2),
          AppSpaces.verticalSpace5,
          Text(mobileVal, style: AppTextStyles.header4),
          AppSpaces.verticalSpace10,
          Text(emailTxt, style: AppTextStyles.subHeader2),
          AppSpaces.verticalSpace5,
          Text(userMail, style: AppTextStyles.header4),
          AppSpaces.verticalSpace10,
          Text(locationTxt, style: AppTextStyles.subHeader2),
          AppSpaces.verticalSpace5,
          Text(locationVal, style: AppTextStyles.header4),
          AppSpaces.verticalSpace10,
          Text(reportingTxt, style: AppTextStyles.subHeader2),
          AppSpaces.verticalSpace5,
          Text(reportingUserTxt, style: AppTextStyles.header4),
          AppSpaces.verticalSpace20,
          Text(inviteSecTxt, style: AppTextStyles.subHeader2),
          AppSpaces.verticalSpace5,
          Row(
            children: [
              Text(inviteMemTxt, style: AppTextStyles.header4),
              AppSpaces.horizontalSpace8,
              AppPrimaryButton(
                  buttonText: inviteBttnTxt, buttonHeight: 25, buttonWidth: sizeWidth*0.18)
            ],
          ),
          AppSpaces.verticalSpace10,
          Text(resetPassBttnTxt, style: AppTextStyles.chatMsgTwo),
          AppSpaces.verticalSpace10,
          Text(logoutBttnTxt, style: AppTextStyles.chatMsgTwo),
          AppSpaces.verticalSpace10,
        ],
      ),
    );
  }
}
