import 'package:e_commerce/screens/sign_up.dart';
import 'package:e_commerce/widgets/button.dart';
import 'package:e_commerce/widgets/changescreen.dart';
import 'package:e_commerce/widgets/mytextformfiels.dart';
import 'package:e_commerce/widgets/passwordfield.dart';
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
  Widget _buildAllTextFormFIelds() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextFormField("Email", (value) {
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
          }),
        ],
      ),
    );
  }

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
                    _buildAllTextFormFIelds(),
                    Button("Најава", validation),
                    ChangeScreen("Немам сметка!", "Регистрирај се", () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => SignUp()));
                    }),
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
