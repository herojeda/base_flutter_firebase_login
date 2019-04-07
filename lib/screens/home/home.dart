import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key key }) : super(key: key);

  @override
  HomeScreenState createState() => new HomeScreenState();

}

class HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Base Flutter-Firebase Login"),
        ),
        body: SingleChildScrollView(
            child: Text("Bienvenido!!!")
        )
    );
  }
}