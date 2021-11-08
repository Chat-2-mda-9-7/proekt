import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'osnovnoe_pr/list_of_chats.dart';
import 'osnovnoe_pr/list_of_teachers.dart';
import 'osnovnoe_pr/list_of_study.dart';
import 'osnovnoe_pr/kabinet.dart';



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
  Widget _chatPage = ChatPage();
  Widget _listTeachets=NoteList();
  Widget _listStudy=ListStudy();
  Widget _kabinet=Kabinet();
  // late Widget _bodyWidget;
  //
  // static List<Widget> listTimerWidget = <Widget>[
  //   ChatPage(waitChatPage:),
  //   NoteList(),
  //   ChatPage(waitChatPage:0),
  //   ChatPage(waitChatPage:0),
  //  ];
   @override
   void initState() {
      super.initState();
      onTapHandler(selectedIndex);
    }

 Widget _buildCurrentWidget(int type) {
   switch (type) {
     case 0:
       return ChatPage();
     case 1:
        return NoteList();
      case 2:
        return ListStudy();
     case 3:
       return Kabinet();
     default:
       throw ArgumentError();
   }
 }

  // void onItemTepped(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //     _bodyWidget = _buildCurrentWidget(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: this.getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this.selectedIndex,
        //currentIndex: selectedIndex,
        //selectedItemColor: Colors.red[800],
        //onTap: onItemTepped,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.message_outlined, color: Colors.black),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.face, color: Colors.black),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.child_care, color: Colors.black),
              label: ''),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            label: '',
          ),
        ],

        onTap: (int index) {
        this.onTapHandler(index);}
        // currentIndex: selectedIndex,
        // onTap: onItemTepped,
      ),
    );
  }
  Widget getBody() {
    if (this.selectedIndex == 0) {
      return this._chatPage;
    } else if (this.selectedIndex == 1) {
      return this._listTeachets;
    } else if(this.selectedIndex==2) {
      return this._listStudy;
    } else {return this._kabinet;
    }
  }
  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }

}
