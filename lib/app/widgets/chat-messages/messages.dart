import 'package:flutter/material.dart';
import '../../data/data_model.dart';
import 'text-messages.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.chatText,
    required this.messageType,
    required this.status,
    required this.isSender,
  }) : super(key: key);

  final String chatText;
  final ChatMessageType messageType;
  final MessageStatus status;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    Widget messageTypes(chatText) {
      return chatText.runtimeType == String
          ? TextMessage(
              message: chatText,
              isSender: isSender,
            )
          : SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSender) ...[
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/emoji/avatar-1.png"),
            ),
            const SizedBox(width: 10),
          ],
          messageTypes(chatText),
          if (isSender) MessageStatusDot(status: status)
        ],
      ),
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  final MessageStatus? status;

  const MessageStatusDot({Key? key, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return Colors.red;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.1);
        case MessageStatus.viewed:
          return Colors.green;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(status!),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
