import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/constant.dart';
import '../../../../data.dart';
import '../../../../utils/size_config.dart';

class ReceptionistChatPage extends StatefulWidget {
  const ReceptionistChatPage({super.key, required this.receptionistId});
  final String receptionistId;

  @override
  State<ReceptionistChatPage> createState() => _ReceptionistChatPageState();
}

class _ReceptionistChatPageState extends State<ReceptionistChatPage> {
  final TextEditingController _sendMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    SizeConfig().init(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Container(
        color: themeProvider.themeMode().containerColor,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: Container(
                  color: Colors.grey.withOpacity(0.5),
                  height: 1.0,
                ),
              ),
              elevation: 0,
              leading: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: themeProvider.themeMode().chatIconColor,
                  )),
              title: Row(
                children: <Widget>[
                  Container(
                    width: getProportionateScreenWidth(40),
                    height: getProportionateScreenHeight(40),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: getProportionateScreenHeight(15),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Receptionist ${widget.receptionistId}",
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(18),
                          fontWeight: FontWeight.bold,
                          color: themeProvider.themeMode().themeColor,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(3),
                      ),
                      Text(
                        "Active now",
                        style: TextStyle(
                          color: themeProvider.themeMode().lineColor,
                          fontSize: getProportionateScreenHeight(14),
                        ),
                      )
                    ],
                  )
                ],
              ),
              actions: <Widget>[
                Icon(
                  LineIcons.phone,
                  color: themeProvider.themeMode().chatIconColor,
                  size: getProportionateScreenHeight(22),
                ),
                SizedBox(
                  width: getProportionateScreenHeight(15),
                ),
                Icon(
                  LineIcons.video,
                  color: themeProvider.themeMode().chatIconColor,
                  size: getProportionateScreenHeight(25),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(8),
                ),
                Container(
                  width: getProportionateScreenWidth(13),
                  height: getProportionateScreenHeight(13),
                  decoration: BoxDecoration(
                      color: online,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white38)),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(15),
                ),
              ],
            ),
            body: getBody(),
            bottomSheet: getBottom(themeProvider),
          ),
        ),
      ),
    );
  }

  Widget getBottom(ThemeProvider themeProvider) {
    return Container(
      height: getProportionateScreenHeight(80),
      width: getProportionateScreenWidth(double.infinity),
      decoration: BoxDecoration(
        color: themeProvider.themeMode().tertiaryThemeColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenHeight(5),
          right: getProportionateScreenHeight(5),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                width: getProportionateScreenWidth(30),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.attach_file_outlined,
                      size: getProportionateScreenHeight(25),
                      color: themeProvider.themeMode().chatIconColor,
                    ),
                    SizedBox(
                      width: getProportionateScreenHeight(15),
                    ),
                    Icon(
                      Icons.camera_alt,
                      size: getProportionateScreenHeight(25),
                      color: themeProvider.themeMode().chatIconColor,
                    ),
                    SizedBox(
                      width: getProportionateScreenHeight(15),
                    ),
                    Icon(
                      Icons.photo,
                      size: getProportionateScreenHeight(25),
                      color: themeProvider.themeMode().hmColor,
                    ),
                    SizedBox(
                      width: getProportionateScreenHeight(15),
                    ),
                    Container(
                      width: getProportionateScreenWidth(200),
                      margin: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(5),
                      ),
                      decoration: BoxDecoration(
                        color: themeProvider.themeMode().inputThemeColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: getProportionateScreenHeight(12),
                        ),
                        child: TextField(
                          cursorColor: themeProvider.themeMode().themeColor,
                          controller: _sendMessageController,
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Aa",
                            suffixIcon: Icon(
                              Icons.face,
                              color: themeProvider.themeMode().hmColor,
                              size: getProportionateScreenHeight(25),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenHeight(15),
                    ),
                    Icon(
                      1 > 2 ? Icons.thumb_up : Icons.send_outlined,
                      size: getProportionateScreenHeight(25),
                      color: themeProvider.themeMode().hmColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    return ListView(
      padding: EdgeInsets.only(
        right: getProportionateScreenHeight(20),
        left: getProportionateScreenHeight(20),
        top: getProportionateScreenHeight(20),
        bottom: getProportionateScreenHeight(80),
      ),
      reverse: true,
      shrinkWrap: true,
      children: List.generate(
        messages.length,
        (index) {
          return ChatBubble(
              isMe: messages[index]['isMe'],
              messageType: messages[index]['messageType'],
              message: messages[index]['message'],
              profileImg: messages[index]['profileImg']);
        },
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool? isMe;
  final String? profileImg;
  final String? message;
  final int? messageType;
  const ChatBubble({
    Key? key,
    this.isMe,
    this.profileImg,
    this.message,
    this.messageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    if (isMe!) {
      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: themeProvider.themeMode().chatIconColor,
                    borderRadius: getMessageType(messageType)),
                child: Padding(
                  padding: EdgeInsets.all(getProportionateScreenHeight(13)),
                  child: Text(
                    message!,
                    style: TextStyle(
                      color: themeProvider.themeMode().containerColor,
                      fontSize: getProportionateScreenHeight(14),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(1.0)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: getProportionateScreenWidth(35),
              height: getProportionateScreenHeight(35),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(profileImg!),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: getProportionateScreenHeight(15),
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: grey, borderRadius: getMessageType(messageType)),
                child: Padding(
                  padding: EdgeInsets.all(getProportionateScreenHeight(13)),
                  child: Text(
                    message!,
                    style: TextStyle(
                      color: black,
                      fontSize: getProportionateScreenHeight(14),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  getMessageType(messageType) {
    if (isMe!) {
      // start message
      if (messageType == 1) {
        return BorderRadius.only(
            topRight: Radius.circular(getProportionateScreenHeight(30)),
            bottomRight: Radius.circular(getProportionateScreenHeight(5)),
            topLeft: Radius.circular(getProportionateScreenHeight(30)),
            bottomLeft: Radius.circular(getProportionateScreenHeight(30)));
      }
      // middle message
      else if (messageType == 2) {
        return BorderRadius.only(
            topRight: Radius.circular(getProportionateScreenHeight(5)),
            bottomRight: Radius.circular(getProportionateScreenHeight(5)),
            topLeft: Radius.circular(getProportionateScreenHeight(30)),
            bottomLeft: Radius.circular(getProportionateScreenHeight(30)));
      }
      // end message
      else if (messageType == 3) {
        return BorderRadius.only(
            topRight: Radius.circular(getProportionateScreenHeight(5)),
            bottomRight: Radius.circular(getProportionateScreenHeight(30)),
            topLeft: Radius.circular(getProportionateScreenHeight(30)),
            bottomLeft: Radius.circular(getProportionateScreenHeight(30)));
      }
      // standalone message
      else {
        return BorderRadius.all(
            Radius.circular(getProportionateScreenHeight(30)));
      }
    }
    // for sender bubble
    else {
      // start message
      if (messageType == 1) {
        return BorderRadius.only(
            topLeft: Radius.circular(getProportionateScreenHeight(30)),
            bottomLeft: Radius.circular(getProportionateScreenHeight(5)),
            topRight: Radius.circular(getProportionateScreenHeight(30)),
            bottomRight: Radius.circular(getProportionateScreenHeight(30)));
      }
      // middle message
      else if (messageType == 2) {
        return BorderRadius.only(
            topLeft: Radius.circular(getProportionateScreenHeight(5)),
            bottomLeft: Radius.circular(getProportionateScreenHeight(5)),
            topRight: Radius.circular(getProportionateScreenHeight(30)),
            bottomRight: Radius.circular(getProportionateScreenHeight(30)));
      }
      // end message
      else if (messageType == 3) {
        return BorderRadius.only(
            topLeft: Radius.circular(getProportionateScreenHeight(5)),
            bottomLeft: Radius.circular(getProportionateScreenHeight(30)),
            topRight: Radius.circular(getProportionateScreenHeight(30)),
            bottomRight: Radius.circular(getProportionateScreenHeight(30)));
      }
      // standalone message
      else {
        return BorderRadius.all(
            Radius.circular(getProportionateScreenHeight(30)));
      }
    }
  }
}
