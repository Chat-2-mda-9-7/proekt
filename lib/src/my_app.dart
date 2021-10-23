import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list_of_chats.dart';
import 'list_of_teachers.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chat',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'ЧАТ СПБГУПТД'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  late Widget _bodyWidget;

  // static List<Widget> listTimerWidget = <Widget>[
  //   const StateTimerPage(waitTimeInSec: waitTime),
  //   const BLoCTimerPage(waitTimeInSec: waitTime),
  //   GetXTimerPage(
  //     waitTimeInSec: waitTime,
  //   )
  // ];
  @override
  void initState() {
    super.initState();
    onItemTepped(selectedIndex);
  }

  Widget _buildCurrentWidget(int type) {
    switch (type) {
      case 0:
        return ChatPage();
      case 1:
        return NoteList();
      case 2:
        return ChatPage();
      case 3:
        return ChatPage();
      default:
        throw ArgumentError();
    }
  }

  void onItemTepped(int index) {
    setState(() {
      selectedIndex = index;
      _bodyWidget = _buildCurrentWidget(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: _bodyWidget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        //selectedItemColor: Colors.red[800],
        onTap: onItemTepped,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.grey,
              icon: Icon(Icons.message_outlined, color: Colors.black),
              label: 'Чаты'),
          BottomNavigationBarItem(
              icon: Icon(Icons.face, color: Colors.black),
              label: 'Преподаватели'),
          BottomNavigationBarItem(
              icon: Icon(Icons.child_care, color: Colors.black),
              label: 'Студенты'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            label: 'Личный кабинет',
          ),
        ],
      ),
    );
  }
}
