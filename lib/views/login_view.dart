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
  final _loginFormKey = GlobalKey<FormState>();
  var _singupFormKey = GlobalKey<FormState>();
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
              key: _loginFormKey,
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
                    onPressed: () {
                      setState(() {
                        singupVisible = true;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          singupVisible
              ? DraggableScrollableSheet(
                  initialChildSize: 0.9,
                  minChildSize: 0.2,
                  maxChildSize: 0.9,
                  builder: (context, scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(35),
                            topLeft: Radius.circular(35),
                          ),
                          color: Colors.grey,
                        ),
                        //color: Colors.green,
                        height: 500,
                        child: Padding(
                          padding: EdgeInsets.all(32),
                          child: Form(
                            key: _singupFormKey,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: "Name",
                                    labelStyle: TextStyle(color: Colors.white),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Name invalid';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => model.name = value,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    labelStyle: TextStyle(color: Colors.white),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Email invalid';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => model.email = value,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    labelStyle: TextStyle(color: Colors.white),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Password invalid';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => model.password = value,
                                ),
                                model.busy
                                    ? Padding(
                                        padding: const EdgeInsets.all(32),
                                        child: Center(
                                          child: Container(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                      )
                                    : FlatButton(
                                        color: Theme.of(context).primaryColor,
                                        child: Text(
                                          "SignUp",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          if (_singupFormKey.currentState
                                              .validate()) {
                                            _singupFormKey.currentState.save();
                                          }
                                          

                                          setState(() {});
                                          _controller
                                              .create(model)
                                              .then((data) {
                                            setState(() {});
                                            
                                            print(data.name);
                                            print(data.email);

                                            store.setUser(
                                              data.name,
                                              data.email,
                                              data.picture,
                                              data.token,
                                            );
                                            Navigator.pushNamed(
                                                context, "/home");
                                          });
                                        })
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
