import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  String _name;
  String? Function(String?) _fun;
  MyTextFormField(this._name, this._fun);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: _fun,
      decoration: InputDecoration(
          hintText: "Корисничко име",
          hintStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder()),
    );
  }
}
