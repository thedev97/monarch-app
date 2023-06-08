import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/values.dart';
import '../dummy/profile_dummy_img.dart';
import '../profile/text_outlined_button.dart';
import 'back_button.dart';

class DefaultNav extends StatelessWidget {
  final ProfileDummyTypeImg? type;
  const DefaultNav({Key? key, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      AppBackButton(horizontalIcon: false),
      Builder(builder: (context) {
        if (type == ProfileDummyTypeImg.Icon) {
          return ProfileDummyImg(
              color: HexColor.fromHex("93F0F0"),
              dummyType: ProfileDummyTypeImg.Image,
              image: "assets/team-prof.png",
              scale: 1.2);
        } else if (type == ProfileDummyTypeImg.Image) {
          return ProfileDummyImg(
              color: HexColor.fromHex("9F69F9"),
              dummyType: ProfileDummyTypeImg.Icon,
              scale: 1.0);
        } else if (type == ProfileDummyTypeImg.Button) {
          return OutlinedButtonWithText(
            width: 75,
            content: "Edit",
            onPressed: () {
              //Get.to(() => EditProfilePage());
            },
          );
        } else {
          return Container();
        }
      }),
    ]);
  }
}
