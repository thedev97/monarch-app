import 'package:Monarch/app/core/values/sizes.dart';
import 'package:Monarch/app/core/values/values.dart';
import 'package:flutter/material.dart';
import '../../core/values/colors.dart';
import '../../core/values/images.dart';
import '../../core/values/strings.dart';
import '../../data/data_model.dart';
import '../../widgets/chats/chat_card.dart';
import '../../widgets/dummy/profile_dummy_img.dart';
import '../../widgets/forms/search_box_form.dart';
import 'messaging_screen.dart';
import 'package:Monarch/app/widgets/navigation/default_back_button.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _searchController = new TextEditingController();
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: SafeArea(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [DefaultBack(), profileImg()],
            ),
            chatHeaderSection(),
            isSearch == true ? searchSection() : Container(),
            chatUserListSection()
          ],
        ),
      ),
    );
  }

  Widget searchSection() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.17),
      child: Container(
        height: 50,
        width: sizeWidth,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: SearchBoxInput(
            placeholder: searchPlaceHolderTxt, controller: _searchController),
      ),
    );
  }

  Widget chatHeaderSection() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.08),
      child: Container(
        height: 50,
        width: sizeWidth,
        decoration: BoxDecoration(
            color: chatHeaderColor,
            border: Border.all(color: Colors.grey.shade200, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Image.asset(edit_img, width: 20, height: 20),
            ),
            Text(
              chatText,
              style: AppTextStyles.header3,
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: InkWell(
                  onTap: () {
                    setState(() {
                      isSearch = !isSearch;
                    });
                  },
                  child: Image.asset(search_img, width: 20, height: 20)),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileImg() {
    return InkWell(
      onTap: () => print(''),
      child: ProfileDummyImg(
          color: HexColor.fromHex("93F0F0"),
          dummyType: ProfileDummyTypeImg.Image,
          image: profile_img,
          scale: 1),
    );
  }

  Widget chatUserListSection() {
    final dynamic chatData = AppData.chatUsers;
    List<Widget> chatUser = List.generate(
        chatData.length,
        (index) => ChatCard(
              page: MessagingScreen(),
              userName: chatData[index]['name'],
              time: chatData[index]['time'],
              image: chatData[index]['profileImage'],
              imageBackground: chatData[index]['color'],
              isActive: chatData[index]['isActive'],
              lastMsg: chatData[index]['lastMessage'],
            ));
    return Padding(
      padding: EdgeInsets.only(
          top: isSearch == false ? sizeHeight * 0.15 : sizeHeight * 0.1),
      child: ListView(children: [...chatUser]),
    );
  }
}
