// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import '../../../models/chatUsersModel.dart';
import '../../../widgets/conversationList.dart';
import 'package:vibra/helper/readmorse.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
// example Data
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Jane Russel",
        messageText: "Awesome Setup",
        imageURL:
            "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80",
        time: "Now"),
    ChatUsers(
        name: "Glady's Murphy",
        messageText: "That's Great",
        imageURL:
            "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80",
        time: "Yesterday"),
    ChatUsers(
        name: "Jorge Henry",
        messageText: "Hey where are you?",
        imageURL:
            "https://images.unsplash.com/flagged/photo-1573740144655-bbb6e88fb18a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
        time: "31 Mar"),
    ChatUsers(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        imageURL:
            "https://images.unsplash.com/photo-1639149888905-fb39731f2e6c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
        time: "28 Mar"),
    ChatUsers(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        imageURL:
            "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
        time: "23 Mar"),
    ChatUsers(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        imageURL:
            "https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=644&q=80",
        time: "17 Mar"),
    ChatUsers(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        imageURL:
            "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png",
        time: "24 Feb"),
    ChatUsers(
        name: "John Wick",
        messageText: "How are you?",
        imageURL:
            "https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
        time: "18 Feb"),
    ChatUsers(
        name: "John Wick",
        messageText: "How are you?",
        imageURL:
            "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png",
        time: "18 Feb"),
    ChatUsers(
        name: "John Wick",
        messageText: "How are you?",
        imageURL:
            "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png",
        time: "18 Feb"),
    ChatUsers(
        name: "John Wick",
        messageText: "How are you?",
        imageURL:
            "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png",
        time: "18 Feb"),
  ];
// end of example data

  void helpme(List<ChatUsers> people, String personName) {
    for (var i = 0; i < chatUsers.length; i++) {
      if (chatUsers[i].name == personName) {
        print('Found in index${i}: ${personName}');
        // Found the person, stop the loop
        return;
      }
    }
  }

  Map timimg = {'-': 200, '.': 50, ' ': 0};
  Map mapper = {
    'a': '.-',
    'b': '-...',
    'c': '-.-.',
    'd': '-..',
    'e': '.',
    'f': '..-.',
    'g': '--.',
    'h': '....',
    'i': '..',
    'j': '.---',
    'k': '-.-',
    'l': '.-..',
    'm': '--',
    'n': '-.',
    'o': '---',
    'p': '.--.',
    'q': '--.-',
    'r': '.-.',
    's': '...',
    't': '-',
    'u': '..-',
    'v': '...-',
    'w': '.--',
    'x': '-..-',
    'y': '-.--',
    'z': '--..',
    ' ': '     ',
  };
  String code = '';
  void encoder() {
    setState(() {
      String temp = chatUsers[0].name.toLowerCase();

      for (int i = 0; i < temp.length; ++i) {
        print(temp[i]);
        code += (mapper[temp[i]] + " ");
        print(code);
      }
    });
  }

  void vibe() {
    for (int i = 0; i < code.length - 1; i++) {
      int time = timimg[code[i]];
      Vibration.vibrate(duration: time);
      sleep(Duration(milliseconds: time + 100));
    }
  }

  @override
  Widget build(BuildContext context) {
    encoder();
    vibe();
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "VIBRA",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromARGB(255, 228, 242, 252),
                      ),
                      // SOS Section
                      child: GestureDetector(
                        onTap: () {
                          Vibration.vibrate();
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.warning_amber_outlined,
                              color: Color.fromARGB(255, 30, 67, 233),
                              size: 20,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "SOS",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Data Area
            SizedBox(
              child: ListView.builder(
                itemCount: chatUsers.length,
                shrinkWrap: true,
                
                padding: EdgeInsets.only(top: 20),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ConversationList(
                    name: chatUsers[index].name,
                    messageText: chatUsers[index].messageText,
                    imageUrl: chatUsers[index].imageURL,
                    time: chatUsers[index].time,
                    isMessageRead: (index == 0 || index == 3) ? true : false,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
