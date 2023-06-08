import 'package:Monarch/app/core/values/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/colors.dart';
import '../../core/values/images.dart';
import '../../core/values/values.dart';
import '../../data/data_model.dart';
import '../../widgets/chat-messages/messages.dart';
import '../../widgets/navigation/default_back_button.dart';

class MessagingScreen extends StatelessWidget {
  const MessagingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          extendBody: false,
          body: Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Stack(
              children: [
                buildHeaderBar(),
                messagingSection(),
              ],
            ),
          ),
          bottomNavigationBar: chatInputFeild(),
        )
    );
  }

  Widget buildHeaderBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: const DefaultBack(),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/emoji/avatar-1.png"),
            ),
            AppSpaces.horizontalSpace10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Gareth Reid",
                  style: AppTextStyles.chatMsgHeader,
                ),
                AppSpaces.verticalSpace2,
                Text(
                  "Active 3m ago",
                  style: AppTextStyles.chatMsgSubHeader,
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Image.asset(call_img, height: 25, width: 25,),
        ),
      ],
    );
  }

  Widget messagingSection() {
    final dynamic chatMsgData = AppData.chatMessages;
    List<Widget> chatMessageList = List.generate(
        chatMsgData.length,
            (index) => Message(
              isSender: chatMsgData[index]['isSender'],
              status: chatMsgData[index]['messageStatus'],
              chatText: chatMsgData[index]['message'],
              messageType: chatMsgData[index]['messageType'],
        ));
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sizeHeight*0.08),
      child: ListView(children: [...chatMessageList]),
    );
  }

  Widget chatInputFeild(){
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 32,
            color: const Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
            Container(
                height: 35,
                width: 35,
                decoration:
                BoxDecoration(shape: BoxShape.circle, color: primaryColor),
                child: Icon(Icons.add, color: Colors.white, size: 20,)),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20 * 0.75,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      smile_img,
                      height: 25,
                      width: 25,
                    ),
                    const SizedBox(width: 20 / 2),
                    Expanded(
                      child: TextField(
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: HexColor.fromHex("3C3E49")),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20 / 2),
                    Image.asset(
                      camera_img,
                      height: 25,
                      width: 25,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
                height: 35,
                width: 35,
                decoration:
                BoxDecoration(shape: BoxShape.circle, color: primaryColor),
                child: Icon(Icons.mic, color: Colors.white, size: 20,)),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

