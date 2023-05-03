import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/values.dart';
import '../dummy/profile_dummy_img.dart';
import '../profile/text_outlined_button.dart';
import 'back_button.dart';

class DefaultNav extends StatelessWidget {
  final String title;
  final ProfileDummyTypeImg? type;
  const DefaultNav({Key? key, this.type, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      AppBackButton(horizontalIcon: false),
      Text(this.title,
          style: GoogleFonts.lato(shadows: [
            Shadow(
                color: Colors.black,
                offset: Offset(0.0, 1.0),
                blurRadius: 1.0),
          ],
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20)),
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
