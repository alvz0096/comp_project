import 'package:flutter/material.dart';
import 'pages/main_screen.dart';

Widget buildPages(int index) {
  List<Widget> _widget = [
    MainScreen(),
    const Center(
      child: Text('Appointment Ui'),
    ),
    const Center(
      child: Text('Chats UI'),
    ),
    const Center(
      child: Text('Drug Store UI'),
    ),
    const Center(
      child: Text('Profile Ui'),
    ),
  ];

  return _widget[index];
}
