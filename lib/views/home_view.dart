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
        child: Text(store.name),
      ),
    );
  }
}
