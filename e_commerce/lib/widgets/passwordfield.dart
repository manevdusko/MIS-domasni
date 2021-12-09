import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  bool _obscure;
  VoidCallback _onTap;
  PasswordField(this._obscure, this._onTap);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscure,
      validator: (value) {
        if (value == "") {
          return "Внеси лозинка";
        } else if (value!.length < 8) {
          return "Лозинката треба да е подолга од 8 карактери";
        }
        return "";
      },
      decoration: InputDecoration(
        hintText: "Лозинка",
        hintStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
        suffixIcon: GestureDetector(
          onTap: _onTap,
          child: Icon(
            _obscure == true ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
