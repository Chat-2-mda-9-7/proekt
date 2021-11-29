import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proekt/src/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:proekt/src/screens/landing.dart';

import 'src/domain/user.dart';

// import 'package:proekt/src/screens/landing.dart';

import 'package:proekt/src/screens/authorization.dart';
// import 'src/screens/authorization.dart';
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaxFitApp());}


class MaxFitApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return StreamProvider<AuthUser?>.value(
      value: AuthService().currentUser,
      initialData: null,
      child: MaterialApp(
        title: 'СПБГУПТД',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(50,65,85,1),
          textTheme: TextTheme(subtitle1: TextStyle(color: Colors.white))
        ),
        home:LandingPage()
      ),
    );
  }
}


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyAp());
// }