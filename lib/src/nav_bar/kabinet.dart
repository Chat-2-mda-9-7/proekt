import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Kabinet extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Search',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.light,
        primarySwatch:Colors.yellow,
        primaryColor: Color(0xFFFFBB54),
        accentColor: Color(0xFFECEFF1),
      ),
      // home: new SearchList(),
    );
  }
}
//
// class SearchList extends StatefulWidget {
//   SearchList({Key? key,}) : super(key: key);
//
//   // final db = FirebaseFirestore.instance;
//   @override
//   _SearchListState createState() => new _SearchListState();
//
// }
// class _SearchListState extends State<SearchList>
// {
//   Widget appBarTitle = new Text("Search Sample", style: new TextStyle(color: Colors.white),);
//   Icon actionIcon = new Icon(Icons.search, color: Colors.white,);
//   final key = new GlobalKey<ScaffoldState>();
//   final TextEditingController _searchQuery = new TextEditingController();
//   List<String> _list;
//   bool _IsSearching;
//   String _searchText = "";
//
//   _SearchListState() {
//     _searchQuery.addListener(() {
//       if (_searchQuery.text.isEmpty) {
//         setState(() {
//           _IsSearching = false;
//           _searchText = "";
//         });
//       }
//       else {
//         setState(() {
//           _IsSearching = true;
//           _searchText = _searchQuery.text;
//         });
//       }
//     });
//   }
//   @override
//   void initState() {
//     super.initState();
//     _IsSearching = false;
//     init();
//
//   }
//   void init() {
//     _list =  List();
//     _list.add("Гудочкина Анна");
//     _list.add("Якубовский Иван");
//     _list.add("Шестакова Виктория");
//     _list.add("Фомичев Виталий");
//     _list.add("Павленко Александр");
//     _list.add("Шесткаво Семён");
//     _list.add("Бушманов Николай");
//     _list.add("Самохин Григорий");
//     _list.add("Наумова Татьяна");
//     _list.add("Кочергин Даниил");
//     _list.add("Лободина Елизавета");
//   }
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       key: key,
//       appBar: buildBar(context),
//       body: new ListView(
//         padding: new EdgeInsets.symmetric(vertical: 8.0),
//         children: _IsSearching ? _buildSearchList() : _buildList(),
//       ),
//     );
//   }
//   List<ChildItem> _buildList() {
//     return _list.map((contact) => new ChildItem(contact)).toList();
//   }
//
//   List<ChildItem> _buildSearchList() {
//     if (_searchText.isEmpty) {
//       return _list.map((contact) => new ChildItem(contact))
//           .toList();
//     }
//     else {
//       List<String> _searchList = List();
//       for (int i = 0; i < _list.length; i++) {
//         String  name = _list.elementAt(i);
//         if (name.toLowerCase().contains(_searchText.toLowerCase())) {
//           _searchList.add(name);
//         }
//       }
//       return _searchList.map((contact) => new ChildItem(contact))
//           .toList();
//     }
//   }
//   Widget buildBar(BuildContext context) {
//     return new AppBar(
//         centerTitle: true,
//         title: appBarTitle,
//         actions: <Widget>[
//           new IconButton(icon: actionIcon, onPressed: () {
//             setState(() {
//               if (this.actionIcon.icon == Icons.search) {
//                 this.actionIcon = new Icon(Icons.close, color: Colors.white,);
//                 this.appBarTitle = new TextField(
//                   controller: _searchQuery,
//                   style: new TextStyle(
//                     color: Colors.white,
//
//                   ),
//                   decoration: new InputDecoration(
//                       prefixIcon: new Icon(Icons.search, color: Colors.white),
//                       hintText: "Search...",
//                       hintStyle: new TextStyle(color: Colors.white)
//                   ),
//                 );
//                 _handleSearchStart();
//               }
//               else {
//                 _handleSearchEnd();
//               }
//             });
//           },),
//         ]
//     );
//   }
//   void _handleSearchStart() {
//     setState(() {
//       _IsSearching = true;
//     });
//   }
//
//   void _handleSearchEnd() {
//     setState(() {
//       this.actionIcon = new Icon(Icons.search, color: Colors.white,);
//       this.appBarTitle =
//       new Text("Search Sample", style: new TextStyle(color: Colors.white),);
//       _IsSearching = false;
//       _searchQuery.clear();
//     });
//   }
//
// }
// class ChildItem extends StatelessWidget {
//   final String name;
//   ChildItem(this.name);
//   @override
//   Widget build(BuildContext context) {
//     return new ListTile(title: new Text(this.name));
//   }
//
// }