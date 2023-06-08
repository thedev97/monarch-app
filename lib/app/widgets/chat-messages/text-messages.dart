import 'package:Monarch/app/core/values/colors.dart';
import 'package:Monarch/app/core/values/values.dart';
import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.isSender,
    required this.message,
  }) : super(key: key);

  final bool isSender;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20 * 0.75,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: isSender ? Color(0XFFEFEEFA) : primaryColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topRight: Radius.circular(15)),
      ),
      child: Text(message,
          style:
              isSender ? AppTextStyles.chatMsgTwo : AppTextStyles.chatMsgOne),
    );
  }
}
