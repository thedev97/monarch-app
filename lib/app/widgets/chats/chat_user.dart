import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/values.dart';
import 'online_user_profile.dart';

class ChatUser extends StatelessWidget {
  final String userName;
  final String image;
  final String imageBackground;
  final bool isActive;
  final String time;

  const ChatUser(
      {Key? key,
      required this.userName,
      required this.image,
      required this.imageBackground,
      required this.isActive,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () {
          //Get.to(() => MessagingScreen(userName: userName, image: image, color: imageBackground));
        },
        child: Row(children: [
          OnlineUserProfile(
            image: image,

          ),
          AppSpaces.horizontalSpace20,
          Text(userName,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18))
        ]),
      ),
    );
  }
}
