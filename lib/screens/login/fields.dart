import 'package:flutter/material.dart';
import 'package:base_flutter_firebase_login/components/fields/inputField.dart';
import 'package:base_flutter_firebase_login/components/buttons/roundedButton.dart';
import 'package:base_flutter_firebase_login/themes/style.dart';
import 'package:base_flutter_firebase_login/services/validator.dart';
import 'package:base_flutter_firebase_login/models/user.dart';
import 'package:base_flutter_firebase_login/interactors/login/loginInteractor.dart';

class Fields extends Container {

  Fields(
    final Size screenSize,
    final GlobalKey<FormState> formKey,
    final Validator validator,
    final LoginInteractor interactor,
    User user
  ) :
  super(
    height: screenSize.height / 2,
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Form(
          key: formKey,
          autovalidate: interactor.autovalidate,
          child: new Column(
            children: <Widget>[
              new InputField(
                  hintText: "Usuario",
                  obscureText: false,
                  textInputType: TextInputType.text,
                  textStyle: textStyle,
                  textFieldColor: textFieldColor,
                  icon: Icons.mail_outline,
                  iconColor: Colors.white,
                  bottomMargin: 20.0,
                  validateFunction: validator.validateEmail,
                  onSaved: (String email) {
                    user.email = email;
                  }),
              new InputField(
                  hintText: "Contraseña",
                  obscureText: true,
                  textInputType: TextInputType.text,
                  textStyle: textStyle,
                  textFieldColor: textFieldColor,
                  icon: Icons.lock_open,
                  iconColor: Colors.white,
                  bottomMargin: 30.0,
                  validateFunction:
                  validator.validatePassword,
                  onSaved: (String password) {
                    user.password = password;
                  }),
              new RoundedButton(
                buttonName: "Ingresar",
                onTap: interactor.handleSubmitted,
                width: screenSize.width,
                height: 50.0,
                bottomMargin: 10.0,
                borderWidth: 0.0,
                buttonColor: primaryColor,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}





