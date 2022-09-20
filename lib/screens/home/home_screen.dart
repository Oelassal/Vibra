import 'package:flutter/material.dart';
import 'package:vibra/components/coustom_bottom_nav_bar.dart';
import 'package:vibra/enums.dart';
import 'components/chatPage.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatPage(),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
