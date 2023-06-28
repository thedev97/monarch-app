import 'package:Monarch/app/core/values/values.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(
      {Key? key,
      required this.userName,
      required this.image,
      required this.isActive,
      required this.lastMsg,
      required this.time,
      required this.status,
      required this.project})
      : super(key: key);

  final String userName;
  final String image;
  final String lastMsg;
  final bool isActive;
  final String time;
  final String status;
  final String project;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Stack(
            children: [
              Image.asset(
                image,
                height: 25,
                width: 25,
              ),
              isActive == false
                  ? Container()
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
                              color: Theme.of(context).scaffoldBackgroundColor,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 2,
              ),
              Opacity(
                opacity: 0.64,
                child: Text(
                  status,
                  style: AppTextStyles.subHeader4,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Opacity(
                opacity: 0.64,
                child: Text(
                  time,
                  style: AppTextStyles.subHeader4,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Opacity(
                opacity: 0.64,
                child: Text(
                  project,
                  style: AppTextStyles.subHeader4,
                ),
              ),
              SizedBox(
                height: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
