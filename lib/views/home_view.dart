import 'package:flutter/material.dart';
import 'package:login_mobx/stores/app_store.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppStore store = Provider.of<AppStore>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 32),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                  store.picture,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Text(
                  store.name,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  store.email,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
