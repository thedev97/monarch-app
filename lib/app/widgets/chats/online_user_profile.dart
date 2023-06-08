import 'package:Monarch/app/widgets/dummy/profile_dummy_img.dart';
import 'package:flutter/material.dart';
import '../../core/utils/extension.dart';

class OnlineUserProfile extends StatelessWidget {
  final String image;
  final String imageBackground;
  const OnlineUserProfile(
      {Key? key, required this.image, required this.imageBackground})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileDummyImg(
        dummyType: ProfileDummyTypeImg.Image,
        scale: 1,
        image: image,
        color: HexColor.fromHex(imageBackground));
  }
}
