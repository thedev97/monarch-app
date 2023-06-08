import 'package:Monarch/app/core/values/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'online_user_profile.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.userName,
    required this.image,
    required this.imageBackground,
    required this.isActive,
    this.page,
    required this.lastMsg,
    required this.time,
  }) : super(key: key);

  final String userName;
  final String image;
  final String imageBackground;
  final String lastMsg;
  final bool isActive;
  final StatelessWidget? page;
  final String time;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (page != null) Get.to(() => page!);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            Stack(
              children: [
                OnlineUserProfile(
                  image: image,
                  imageBackground: imageBackground,
                ),
                isActive == false
                    ? Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                width: 2),
                          ),
                        ),
                      )
                    : Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                width: 2),
                          ),
                        ),
                      )
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: AppTextStyles.header2,
                    ),
                    const SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        lastMsg,
                        maxLines: 1,
                        style: AppTextStyles.subHeader2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Text(
                time,
                style: AppTextStyles.subHeader2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
