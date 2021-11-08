import 'package:flutter/material.dart';
import 'my_app.dart';

import 'package:get/get.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chat',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const StartPage(title: 'ЧАТ СПБГУПТД'),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StartPage> createState() => _StartPageState();}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(title: Text("First Screen")),
      body: Center(
        child: RaisedButton(
          child: Text("Go to Second Screen"),

          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return MyApp();}));
          },
        ),
      ),
    );
  }
}
