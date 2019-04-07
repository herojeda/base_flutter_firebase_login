import 'package:flutter/material.dart';
import 'package:base_flutter_firebase_login/screens/home/home.dart';
import 'package:base_flutter_firebase_login/themes/style.dart';

class Routes {

  var routes = <String, WidgetBuilder>{
    "/HomePage": (BuildContext context) => new HomeScreen()
  };

  Routes() {
    runApp(new MaterialApp(
      title: "Base Flutter-Firebase Login.",
      home: new HomeScreen(),
      theme: appTheme,
      routes: routes,
    ));
  }

}