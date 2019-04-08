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
    this._scaffoldKey,
    this.user,
  ) :
  _authService = new AuthService(),
  autovalidate = false;

  void handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      this.autovalidate = true; // Start validating on every change.
      showInSnackBar('Por favor, corrija los errores marcados en rojo');
    } else {
      form.save();
      try {
        _authService.verifyUser(user).then((onValue) {
          if (onValue)
            Navigator.pushNamed(_context, "/HomePage");
          else
            showInSnackBar("Error, revise su usuario y/o contraseña");
        }).catchError((PlatformException onError) {
          showInSnackBar(onError.message);
        });
      } catch (e) {
        showInSnackBar("Error, revise su usuario y/o contraseña");
      }
    }
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
      .showSnackBar(SnackBar(
        content: Text(value),
        duration: Duration(seconds: 10),
    ));
  }

}