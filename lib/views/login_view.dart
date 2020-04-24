import 'package:flutter/material.dart';
import 'package:login_mobx/controllers/signup_controller.dart';
import 'package:login_mobx/stores/app_store.dart';
import 'package:login_mobx/view-models/signup_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = SignupController();
  SignupViewModel model = SignupViewModel();
  bool visibilityPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(32, 200, 32, 0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(32, 0, 16, 0),
                    child: Icon(Icons.email),
                  ),
                  //contentPadding: EdgeInsets.fromLTRB(32, 16, 16, 16)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
              ),
              TextFormField(
                obscureText: !visibilityPassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(32, 0, 16, 0),
                      child: Icon(Icons.lock),
                    ),
                    suffixIcon: IconButton(
                      icon: visibilityPassword
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: () => setState(() {
                        visibilityPassword = !visibilityPassword;
                      }),
                    )),
              ),
              Padding(padding: EdgeInsets.only(top: 8)),
              Container(
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: GestureDetector(
                  child: Text(
                    "Forgot Password?",
                    //style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  //onTap: () => Navigator.pushNamed(context, "/signup"),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 32)),
              FlatButton(
                //padding: EdgeInsets.only(left: 16, right: 16),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Colors.purple),
                ),
                child: Container(
                  width: 120,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "LOG IN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () {},
              ),
              Padding(padding: EdgeInsets.only(top: 120)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account?"),
                  GestureDetector(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                    onTap: () => Navigator.pushNamed(context, "/signup"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
