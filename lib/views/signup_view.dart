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
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(32, 64, 32, 64),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text("Register"),
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
                            //Navigator.pushReplacementNamed(context, "/home");
                            
                            Navigator.pushNamedAndRemoveUntil(context, "/home", ModalRoute.withName("/"));
                          });
                        }
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}

/*
 @override
  Widget build(BuildContext context) {
    AppStore store = Provider.of<AppStore>(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(32, 64, 32, 64),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text("Register"),
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
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                        }

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
                        });
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
*/
