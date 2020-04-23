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
  bool singupVisible = false;

  @override
  Widget build(BuildContext context) {
    AppStore store = Provider.of<AppStore>(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16, 64, 16, 64),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text("Login"),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Password"),
                  ),
                  FlatButton(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                  FlatButton(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "Create Account",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => Navigator.pushNamed(context, "/signup"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

