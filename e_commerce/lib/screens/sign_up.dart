import 'package:e_commerce/screens/login.dart';
import 'package:e_commerce/widgets/button.dart';
import 'package:e_commerce/widgets/changescreen.dart';
import 'package:e_commerce/widgets/mytextformfiels.dart';
import 'package:e_commerce/widgets/passwordfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _obscure = true;
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

  Widget _buildAllTextFormFIelds() {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextFormField("Корисничко име", (value) {
            if (value == "") {
              return "Внеси корисничко име";
            }
            return "";
          }),
          MyTextFormField("email", (value) {
            if (value == "")
              return "Внесете емаил!";
            else if (!regExp.hasMatch(value!)) {
              return "Невалидна емаил";
            }
            return "";
          }),
          PasswordField(true, () {
            FocusScope.of(context).unfocus();
            setState(() {
              obserText = !obserText;
            });
          })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
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
                Container(
                  height: 400,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //textformfield
                      _buildAllTextFormFIelds(),
                      Button("Регистрација", validate),
                      ChangeScreen("Имам корисничка сметка", "Најава", () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (ctx) => Login()));
                      }),
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
