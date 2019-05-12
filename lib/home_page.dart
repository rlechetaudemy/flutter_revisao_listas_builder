import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: _body(),
    );
  }

  _body() {
    return ListView(
      children: <Widget>[
        _img("dog1.png"),
        _img("dog2.png"),
        _img("dog3.png"),
        _img("dog4.png"),
        _img("dog5.png"),
      ],
    );
  }

  _img(String s) {
    return Container(
      height: 300,
      child: Image.asset(
        "assets/images/$s",
        fit: BoxFit.cover,
      ),
    );
  }
}
