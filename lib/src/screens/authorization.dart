import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:proekt/src/domain/user.dart';
import 'package:proekt/src/services/auth.dart';

class MyAp extends StatelessWidget {
  const MyAp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chat',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Authorization(title: 'ЧАТ СПБГУПТД'),
    );

  }
}

class Authorization extends StatefulWidget{
  Authorization({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  _AuthorizationState createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization>{
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late String _email;
  late String _password;
  bool showLogin= true;


  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context){

    Widget _logo(){
      return Padding(
        padding: EdgeInsets.only(top:100),
        child: Container(
          child: Align(
            child: Text('ЧАТ СПБГУПТД', style: TextStyle(fontSize:45, fontWeight: FontWeight.bold, color: Colors.black12),)
          ),
        ),
      );
    }

    Widget _imput(Icon icon, String hint, TextEditingController controller, bool obsecure){
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obsecure,
          style: TextStyle(fontSize: 20, color: Colors.black),
          decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white70, width: 3)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1)
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left:10,right: 10),
                child: IconTheme(
                  data:IconThemeData(color: Colors.black),
                  child: icon
              )
            )
          ),
        ),
      );
    }

    Widget _button(String text, void func()){
      return RaisedButton(
        splashColor: Theme.of(context).primaryColor,
        highlightColor: Theme.of(context).primaryColor,
        color: Colors.white70,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 20)
        ),
        onPressed: (){
          func();
        },
      );
    }

    Widget _form(String label, void func()){
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom:20, top:10),
              child: _imput(Icon(Icons.email), "EMAIL", _emailController, false),
        ),
            Padding(
               padding: EdgeInsets.only(bottom:20),
               child: _imput(Icon(Icons.lock), "PASSWORD", _passwordController, true),
      ),
            SizedBox(height: 20,),
            Padding(
                padding: EdgeInsets.only(left:20, right: 20),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: _button(label, func)
      ),
      )
        ],
        ),
      );
    }

    void _loginButtonAction() async{
      _email = _emailController.text;
      _password = _passwordController.text;

      if(_email.isEmpty || _password.isEmpty) return;

      AuthUser? user = await _authService.signInWithEmailAndPassword(_email.trim(), _password.trim()); //**
      if(user == null){
        Fluttertoast.showToast(
            msg: "Can`t SignIn you! Please check your email//password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }else{
        _emailController.clear();
        _passwordController.clear();
      }
    }

    void _registerButtonAction() async{
      _email = _emailController.text;
      _password = _passwordController.text;

      if(_email.isEmpty || _password.isEmpty) return;

      AuthUser? user = await _authService.registerWithEmailAndPassword(_email.trim(), _password.trim());//**
      if(user == null){
        Fluttertoast.showToast(
            msg: "Can`t Register you! Please check your email//password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }else{
        _emailController.clear();
        _passwordController.clear();
      }
    }

    Widget _bottomWave(){
      return Expanded(
        child: Align(
          child: ClipPath(
           child: Container(
             color: Colors.white70,
             height: 300,
          ),
            clipper: BottomWaveClipper(),
        ),
          alignment: Alignment.bottomCenter,
      ),
      );
    }

    return Scaffold(
      backgroundColor:  Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          _logo(),
          (
              showLogin
              ? Column(
                children: <Widget>[
                  _form('LOGIN', _loginButtonAction),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      child: Text('Not registered yet? Register!', style: TextStyle(fontSize: 20, color: Colors.white)),//No registered yet? Register!
                      onTap:(){
                        setState((){
                          showLogin=false;
                    });
                          }
                    )
                  )
                ],
              )
              : Column(
                children: <Widget>[
                  _form('REGISTER', _registerButtonAction),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                          child: Text('Already register? Login!', style: TextStyle(fontSize: 20, color: Colors.white)),//Alredy registered? Register!
                          onTap:(){
                            setState((){
                              showLogin=true;
                            });
                          }
                      )
                  )
                ],
              )
          ),
          _bottomWave()
        ]
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height + 5);
    var secondControllerPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControllerPoint.dx, secondControllerPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}