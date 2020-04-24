import 'package:flutter/material.dart';
import 'package:login_mobx/stores/app_store.dart';
import 'package:login_mobx/views/home_view.dart';
import 'package:login_mobx/views/login_view.dart';
import 'package:login_mobx/views/signup_view.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: LoginView(),
        routes: {
          "/login": (context) => LoginView(),
          "/home": (context) => HomeView(),
          "/signup": (context) => SignupView()
        },
      ),
      providers: [Provider<AppStore>.value(value: AppStore())],
    );
  }
}
