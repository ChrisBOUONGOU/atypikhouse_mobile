import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome user"),
              SizedBox(
                height: 50,
              ),
              OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.exit_to_app,
                    size: 18,
                  ),
                  label: Text("logout")),
            ],
          ),
        ),
      ),
    );
  }
}
