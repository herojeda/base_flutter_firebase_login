import 'package:flutter/material.dart';
import 'package:base_flutter_firebase_login/models/user.dart';
import 'package:base_flutter_firebase_login/interactors/login/loginInteractor.dart';
import 'package:base_flutter_firebase_login/services/validator.dart';
import 'package:base_flutter_firebase_login/screens/login/logo.dart';
import 'package:base_flutter_firebase_login/screens/login/fields.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  BuildContext context;
  LoginInteractor interactor;
  ScrollController scrollController = new ScrollController();
  User user = new User();
  Validator validator = new Validator();

  static final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    this.interactor = new LoginInteractor(formKey, context, _scaffoldKey, user);
    final Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      key: _scaffoldKey,
      body: new SingleChildScrollView(
        controller: scrollController,
        child: new Container(
          padding: new EdgeInsets.all(16.0),
          decoration: new BoxDecoration(color: Colors.blueGrey),
          child: new Column(
            children: <Widget>[
              new Logo(
                screenSize,
                new ExactAssetImage("assets/flutter.png")
              ),
              new Fields(screenSize, formKey, validator, interactor, user)
            ],
          )
        )
      )
    );
  }

}
