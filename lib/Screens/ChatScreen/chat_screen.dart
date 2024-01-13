// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:yitirdim/API/data/services/chat_service.dart';
import 'package:yitirdim/Screens/ChatScreen/chatScreen_controller.dart';
import 'package:yitirdim/Screens/ChatScreen/components/chat_textField.dart';
import 'package:yitirdim/Screens/ChatScreen/components/message_card.dart';
import 'package:yitirdim/Theme/constants.dart';

class ChatScreen extends StatefulWidget {
  final String userName;
  final int fromUserId;
  final int toUserID;
  final int status;

  const ChatScreen(
      {Key? key,
      required this.userName,
      required this.fromUserId,
      required this.toUserID,
      required this.status})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    ChatScreenController chatController = Get.put(ChatScreenController());
    ScrollController scrollController = ScrollController();
    Box dataBox = Hive.box('api');

    DateTime now = DateTime.now();
    void scrollDown() {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 100), curve: Curves.fastOutSlowIn);
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          extendBody: false,
          appBar: AppBar(
            elevation: 0.1,
            // backgroundColor: AppConstants().whiteColor,
            centerTitle: false,
            title: Container(
              margin: EdgeInsets.only(top: 3),
              child: Text(
                widget.userName,
                style: TextStyle(
                  fontSize: AppConstants().fontSize15,
                  fontFamily: 'Comfortaa-SemiBold',
                ),
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                IconlyLight.arrowLeftCircle,
                color: Theme.of(context).iconTheme.color,

                // color: AppConstants().mainColor,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  final Uri url = Uri(scheme: 'sms', path: '+993phone');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                icon: SvgPicture.asset(
                  'assets/svg_icons/message.svg',
                  height: 24,
                  width: 24,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final Uri url = Uri(scheme: 'tel', path: '+99361717146');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                child: SvgPicture.asset(
                  'assets/svg_icons/phone_call.svg',
                  height: 24,
                  width: 24,
                ),
              ),
              SizedBox(
                width: 7,
              )
            ],
          ),
          // backgroundColor: AppConstants().whiteColor,
          body: FutureBuilder(
              future: ChatService().fetchMessages(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Align(
                      alignment: Alignment.topCenter,
                      child: ListView.separated(
                        shrinkWrap: true,
                        reverse: false,
                        padding: const EdgeInsets.only(top: 12, bottom: 60) +
                            const EdgeInsets.symmetric(horizontal: 6),
                        controller: scrollController,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: snapshot.data[index].fromClientId ==
                                        jsonDecode(dataBox.get('data'))['id']
                                    ? Alignment.topRight
                                    : Alignment.topLeft,
                                child: Messages(
                                  text: snapshot.data[index].text,
                                ),
                              ),
                              Align(
                                  alignment: snapshot
                                              .data[index].fromClientId ==
                                          jsonDecode(dataBox.get('data'))['id']
                                      ? Alignment.topRight
                                      : Alignment.topLeft,
                                  child: Text(
                                    DateFormat('dd/MM/yyyy HH:mm')
                                        .format(DateTime.parse(snapshot
                                            .data[index].createdAt
                                            .toString()))
                                        .toString(),
                                    style: TextStyle(
                                        fontFamily: 'Comfortaa-SemiBold',
                                        color: AppConstants().greyColor,
                                        fontSize: AppConstants().fontSize12),
                                  ))
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox();
                        },
                      ));
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          bottomSheet: chatTextField(
            context,
            textController,
            () {
              ChatService()
                  .chatPost(widget.fromUserId, widget.toUserID,
                      textController.text, widget.status)
                  .then((value) {
                if (value == true) {
                  textController.text = '';
                  scrollDown();
                  setState(() {});
                }
              });

              textController.text = '';
              scrollDown();
            },
          )),
    );
  }
}
