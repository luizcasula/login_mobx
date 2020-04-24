import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login_mobx/controllers/app_controller.dart';
import 'package:login_mobx/controllers/signup_controller.dart';
import 'package:login_mobx/view-models/signup_viewmodel.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();

  var model = SignupViewModel();

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<AppController>(context);
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
                        Observer(builder: (_) {
                          return TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              errorText: _controller.signup.validateName(),
                              labelText: "Name",
                            ),
                            //validator: _controller.signup.validateName,
                            onSaved: (value) => model.name = value,
                            onChanged: _controller.signup.changeName,
                          );
                        }),
                        Observer(builder: (_) {
                          return TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              errorText: _controller.signup.validateEmail(),
                              labelText: "Email",
                            ),
                            
                            onSaved: (value) => model.email = value,
                            onChanged: _controller.signup.changeEmail,
                          );
                        }),
                        Observer(builder: (_) {
                          return TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              errorText: _controller.signup.validatePassword(),
                              labelText: "Password",
                            ),
                            //validator: _controller.signup.validatePassword,
                            onSaved: (value) => model.password = value,
                            onChanged: _controller.signup.changePassword,
                          );
                        }),
                        Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: Observer(builder: (_) {
                            return _controller.signup.busy
                                ? Center(
                                    child: Container(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : Container(
                                    width: double.infinity,
                                    height: 50,
                                    child: RaisedButton(
                                      color: Theme.of(context).primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        //side: BorderSide(color: Colors.purple),
                                      ),
                                      child: Text(
                                        "SIGN UP",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: _controller.signup.isAllValid
                                          ? () {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                _formKey.currentState.save();
                                                print(model.name);
                                                print(model.email);
                                                print(model.password);
                                                _controller.signup
                                                    .create(model)
                                                    .then((data) {
                                                  print(data.token);
                                                  _controller.setUser(
                                                    data.name,
                                                    data.email,
                                                    data.picture,
                                                    data.token,
                                                  );
                                                  Navigator.pushNamed(
                                                      context, "/home");
                                                  //Navigator.pushNamedAndRemoveUntil(context, "/home", ModalRoute.withName("/login"));
                                                });
                                              }
                                            }
                                          : null,
                                    ),
                                  );
                          }),
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
                              onTap: () => Navigator.pop(context),
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
