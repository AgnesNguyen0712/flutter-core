import 'package:flutter_core/core/config/routes.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main"),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          child: Text("See Example"),
          onPressed: (){
            Navigator.pushNamed(context, AppRoutes.example);
          },
        ),
      )

    );
  }
}
