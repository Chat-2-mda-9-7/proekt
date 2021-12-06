import 'package:flutter/cupertino.dart';
import 'package:proekt/src/screens/authorization.dart';
import 'package:proekt/src/screens/my_app.dart';
import 'package:flutter/material.dart';
import 'package:proekt/src/domain/user.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key, key}): super(key:key);

  @override
  Widget build(BuildContext context){
    final AuthUser? user = Provider.of<AuthUser?>(context);
    final bool isLoggedIn = user != null;

    return isLoggedIn ?  MyAp() : MyApp();
  }
}