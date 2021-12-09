import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  VoidCallback onPressed;
  final String name;
  Button(this.name, this.onPressed);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: RaisedButton(
            color: Colors.lightBlue, child: Text(name), onPressed: onPressed));
  }
}
