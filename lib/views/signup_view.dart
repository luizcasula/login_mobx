import 'package:flutter/material.dart';
import 'package:login_mobx/controllers/signup_controller.dart';
import 'package:login_mobx/stores/app_store.dart';
import 'package:login_mobx/view-models/signup_viewmodel.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = SignupController();
  var model = SignupViewModel();

  @override
  Widget build(BuildContext context) {
    AppStore store = Provider.of<AppStore>(context);
    return Scaffold(
      //appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            Container(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(32),
                child: Form(
                  key: _formKey,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 28),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Name",
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
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Password invalid';
                            }
                            return null;
                          },
                          onSaved: (value) => model.password = value,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: model.busy
                              ? Padding(
                                  padding: const EdgeInsets.all(32),
                                  child: Center(
                                    child: Container(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: double.infinity,
                                  height: 50,
                                  child: FlatButton(
                                    color: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: Colors.purple),
                                    ),
                                    child: Text(
                                      "Sing UP",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                        print(model.name);
                                        print(model.email);
                                        print(model.password);

                                        setState(() {});
                                        _controller.create(model).then((data) {
                                          setState(() {});
                                          print(data.token);
                                          store.setUser(
                                            data.name,
                                            data.email,
                                            data.picture,
                                            data.token,
                                          );
                                          Navigator.pushNamed(context, "/home");
                                          //Navigator.pushNamedAndRemoveUntil(context, "/home", ModalRoute.withName("/login"));
                                        });
                                      }
                                    },
                                  ),
                                ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 120)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Already have an account? "),
                            GestureDetector(
                              child: Text(
                                "Login here",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w700),
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, "/signup"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: GestureDetector(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                )
*/
