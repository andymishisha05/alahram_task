import 'dart:async';

import 'package:flutter/material.dart';
import 'package:suiiz_clone/screens/home_screen.dart';

class SpalshScreen extends StatelessWidget {
  static const routeName = '/spalsh';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pop();
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome"),
            SizedBox(
              height: 20,
            ),
            Icon(
              Icons.ac_unit,
              color: Colors.amber,
              size: 140,
            ),
          ],
        ),
      ),
    );
  }
}
