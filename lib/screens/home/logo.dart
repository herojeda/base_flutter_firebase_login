import 'package:flutter/material.dart';

class Logo extends Container {

  Logo(final Size screenSize, ExactAssetImage logo) : super(
    height: screenSize.height / 2,
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
            child: new Image(
              image: logo,
              height: (screenSize.width < 500)
                  ? 240.0
                  : (screenSize.width / 2) + 12.0,
              width: screenSize.height / 2 + 20,
            ))
      ],
    )
  );

}