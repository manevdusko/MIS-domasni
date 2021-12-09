import 'package:e_commerce/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  VoidCallback _fun;
  String _text;
  String _actionText;
  ChangeScreen(this._text, this._actionText, this._fun);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(this._text),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
            onTap: _fun,
            child: Text(
              this._actionText,
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ))
      ],
    );
  }
}
