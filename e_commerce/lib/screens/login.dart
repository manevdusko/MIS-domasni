import 'package:e_commerce/screens/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);

void validation() {
  final FormState? _form = _formKey.currentState;
  if (_form!.validate()) {
    print("DA");
  } else
    print("ne");
}

bool obserText = true;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Најава",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == "")
                          return "Внесете емаил!";
                        else if (!regExp.hasMatch(value!)) {
                          return "Невалидна емаил";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextFormField(
                      obscureText: obserText,
                      validator: (value) {
                        if (value == "") {
                          return "Внеси лозинка!";
                        } else if (value!.length < 8) {
                          return "Лозинката е кратка";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        hintText: "password",
                        border: OutlineInputBorder(),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              setState(() {
                                obserText = !obserText;
                              });
                            },
                            child: Icon(
                              obserText == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            )),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                          color: Colors.grey,
                          child: Text("Најава"),
                          onPressed: () {
                            validation();
                          }),
                    ),
                    Row(
                      children: [
                        Text("Немам сметка!"),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: Text("Регистрирај се",
                              style: TextStyle(color: Colors.cyan)),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (ctx) => SignUp()));
                          },
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
