import "package:flutter/material.dart";
import 'package:base_flutter_firebase_login/screens/home/logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key key }) : super(key: key);

  @override
  HomeScreenState createState() => new HomeScreenState();

}

class HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Bienvenido!!!"),
        ),
        body: Logo(screenSize, new ExactAssetImage("assets/flutter-firebase.png"))
    );
  }
}