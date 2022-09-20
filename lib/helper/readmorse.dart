import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:vibra/screens/home/components/chatPage.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReadMorse extends StatefulWidget {
  const ReadMorse({Key? key}) : super(key: key);

  @override
  State<ReadMorse> createState() => _ReadMorseState();
}

class _ReadMorseState extends State<ReadMorse> {
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
    '\'': '',
    '0': '-----',
    '1': '.----',
    '2': '..---',
    '3': '...--',
    '4': '....-',
    '5': '.....',
    '6': '-....',
    '7': '--...',
    '8': '---..',
    '9': '----.',
  };

  @override
  String code = '';
  Widget build(BuildContext context) {
    return Container(
        // getting input here

        );
  }

  TextEditingController texty = new TextEditingController();
  void encoder() {
    setState(() {
      String temp = texty.text.toLowerCase();
      code = '';
      for (int i = 0; i < temp.length; i++) {
        code += mapper[temp[i]] + ' ';
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
}
