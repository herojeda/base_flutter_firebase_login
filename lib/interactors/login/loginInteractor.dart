import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base_flutter_firebase_login/services/authService.dart';
import 'package:base_flutter_firebase_login/models/user.dart';

class LoginInteractor{

  final AuthService _authService;
  GlobalKey<FormState> _formKey;
  GlobalKey<ScaffoldState> _scaffoldKey;
  BuildContext _context;
  bool autovalidate;
  User user;

  LoginInteractor(
    this._formKey,
    this._context,
    this.user
  ) :
  _authService = new AuthService(),
  autovalidate = false;

  void handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      this.autovalidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      _authService.verifyUser(user).then((onValue) {
        if (onValue)
          Navigator.pushNamed(_context, "/HomePage");
        else
          showInSnackBar("Login Successfull");
      }).catchError((PlatformException onError) {
        showInSnackBar(onError.message);
      });
    }
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

}