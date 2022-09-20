// ignore_for_file: file_names

import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
      
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: const EdgeInsets.only(bottom: 10, top: 5),
            height: 70,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                // ignore: avoid_unnecessary_containers
                Container(
                  child: const Expanded(
                      // ignore: unnecessary_const
                      
                    // ignore: unnecessary_const
                    child: const TextField(
                      enabled: true,
                      showCursor: true,
                      readOnly: true,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
