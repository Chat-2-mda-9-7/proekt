import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NoteList extends StatelessWidget {
  NoteList({
    Key? key,
  }) : super(key: key);

  // final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green);
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Преподаватели"),
    //     centerTitle: true,
    //   ),
    //   body: StreamBuilder<QuerySnapshot>(
    //     stream: db.collection('teacher').snapshots(),
    //     builder: (context, snapshot) {
    //       if (!snapshot.hasData) {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       } else
    //         return ListView(
    //           children: snapshot.data!.docs.map((doc) {
    //             return Card(
    //               child: ListTile(
    //                 title: Text('loh'),
    //               ),
    //             );
    //           }).toList(),
    //         );
    //     },
    //   ),
    // );
  }
}
