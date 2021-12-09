import 'package:e_commerce/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);

class _SignUpState extends State<SignUp> {
  void validate() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      print("dA");
    } else {
      print("ne");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Регистрација",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 400,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 6) {
                            return "Корисничкото име е кратко";
                          } else if (value == "") {
                            return "Внесете корисничко име";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                            hintText: "Корисничко име",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == "") {
                            return "Внеси емаил";
                          } else if (!regExp.hasMatch(value!)) {
                            return "Емаил адресата не е валидна";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                            hintText: "E-mail",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value == "") {
                            return "Внеси лозинка";
                          } else if (value!.length < 8) {
                            return "Лозинката е прекратка";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                            hintText: "Лозинка",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      Container(
                        height: 45,
                        width: double.infinity,
                        child: RaisedButton(
                            child: Text("Регистрирај"),
                            color: Colors.blueGrey[400],
                            onPressed: () {
                              validate();
                            }),
                      ),
                      Row(
                        children: [
                          Text("Имам корисничка сметка!"),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (ctx) => Login()));
                              },
                              child: Text(
                                "Најава",
                                style: TextStyle(
                                  color: Colors.cyan,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
