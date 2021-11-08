import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:get/get.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key,}) : super(key: key);
  @override
  _ListState createState() => _ListState(); }

class _ListState  extends State<NoteList>{

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState(){
    super.initState();

    initFirebase();
  }

  @override
  Widget build(BuildContext context) {

    // return Container(color: Colors.green);
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('teacher').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(!snapshot.hasData) return Text('');
        return ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: snapshot.data!.size,
          itemBuilder: (BuildContext context, int index) {
            return Container(clipBehavior: Clip.antiAlias,
             // key: Key(snapshot.data.docs[index]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              height: 50,
              width: 100,
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xffFAFF00), Color(0xfC4C4C4)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    snapshot.data?.docs[index].get('title'),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            )  ;    },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        );
      },
    );
  }
}
// child: enter(child: Text('${entries[index]}')),