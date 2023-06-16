import 'view/notify.dart';
import 'view/profile-view.dart';
import 'view/team-view.dart';
import 'package:flutter/material.dart';
import '../../core/values/images.dart';
import '../../core/values/values.dart';
import 'package:Monarch/app/core/values/sizes.dart';
import 'package:Monarch/app/core/values/strings.dart';
import '../../widgets/buttons/primary_tab_buttons.dart';
import '../../widgets/navigation/default_back_button.dart';
import 'package:Monarch/app/widgets/dummy/profile_dummy_img.dart';

class ProfileOverview extends StatelessWidget {
  ProfileOverview({Key? key}) : super(key: key);

  ValueNotifier<int> _buttonTrigger = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: SafeArea(
            child: Stack(children: [
              buildHeader(),
              userProfile(),
              selectionView(),
              profileViewSection()
            ]),
          ),
        ));
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: DefaultBack(),
    );
  }

  Widget userProfile() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileDummyImg(
              color: HexColor.fromHex("94F0F1"),
              dummyType: ProfileDummyTypeImg.Image,
              scale: 1.4,
              image: profile_img),
          AppSpaces.horizontalSpace10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpaces.verticalSpace10,
              Text(userName, style: AppTextStyles.header2),
              AppSpaces.verticalSpace5,
              Text(userMail, style: AppTextStyles.subHeader2),
            ],
          )
        ],
      ),
    );
  }

  Widget selectionView() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileTabButton(
              buttonText: profileTxt, itemIndex: 0, notifier: _buttonTrigger),
          ProfileTabButton(
              buttonText: notificationTxt,
              itemIndex: 1,
              notifier: _buttonTrigger),
          ProfileTabButton(
              buttonText: teamTxt, itemIndex: 2, notifier: _buttonTrigger),
        ],
      ),
    );
  }

  Widget profileViewSection() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.25),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: _buttonTrigger,
                builder: (BuildContext context, _, __) {
                  return _buttonTrigger.value == 0
                      ? ProfileView()
                      : _buttonTrigger.value == 1
                          ? NotifyView()
                          : TeamView();
                }),
          ],
        ),
      ),
    );
  }
}
