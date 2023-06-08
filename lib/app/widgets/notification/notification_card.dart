import 'package:Monarch/app/core/values/sizes.dart';
import 'package:flutter/material.dart';
import '../../core/values/values.dart';
import '../dummy/profile_dummy_img.dart';

class NotificationCard extends StatelessWidget {
  final bool read;
  final String userName;
  final String time;
  final String message;
  final String image;
  final String imageBackground;

  const NotificationCard(
      {Key? key,
      required this.read,
      required this.userName,
      required this.time,
      required this.message,
      required this.image,
      required this.imageBackground})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ProfileDummyImg(
                    dummyType: ProfileDummyTypeImg.Image,
                    scale: 1.2,
                    image: image,
                    color: HexColor.fromHex(imageBackground)),
                AppSpaces.horizontalSpace10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: read == false
                              ? AppTextStyles.header1
                              : AppTextStyles.header2,
                        ),
                        AppSpaces.horizontalSpace5,
                        SizedBox(
                          width: sizeWidth * 0.4,
                          child: Text(
                            message,
                            style: read == false
                                ? AppTextStyles.subHeader1
                                : AppTextStyles.subHeader2,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    AppSpaces.verticalSpace10,
                    Text(
                      time,
                      style: read == false
                          ? AppTextStyles.subHeader1
                          : AppTextStyles.subHeader2,
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
