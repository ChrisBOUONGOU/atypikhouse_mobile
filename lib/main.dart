import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'pages/home.dart';

const d_purple = Color(0xFF82358c);
const d_white = Color(0xFFffffff);
const d_black = Color(0xFF000000);
const d_darkgrey = Color(0x333333);
const d_lightgrey = Color(0x666666);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atypikhouse',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      //drawer: NavigationDrawerWidget(),
      body: Column(
        children: [
          LoginForm(),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: d_purple,
      // actions: [
      //  IconButton(
      //    icon: Icon(
      //      Icons.favorite,
      //     color: d_white,
      //   ),
      //   onPressed: null,
      //  ),
      //  IconButton(
      //    icon: Icon(
      //      Icons.person,
      //      color: d_white,
      //    ),
      //    onPressed: () {},
      //  ),
      // ],
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Page de connexion",
            style: TextStyle(
              fontSize: 44.0,
              color: d_black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 26),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.mail, color: d_black),
            ),
          ),
          const SizedBox(height: 26),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Mot de passe",
              prefixIcon: Icon(Icons.lock, color: d_black),
            ),
          ),
          const SizedBox(height: 15),
          const SizedBox(height: 26),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: d_purple,
              elevation: 0.0,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              onPressed: () {},
              child: Text(
                "Connexion",
                style: TextStyle(
                  color: d_white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 26),
          FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text("hello");
              }),
        ],
      ),
    );
  }

  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };

  Future<void> getData() async {
    var url = Uri.parse("http://atypikhouse.local/api");

    print("fetching $url");
    var response = await http.get(url, headers: headers);
    if (response.statusCode != 200) {
      throw Exception(
          "Request to $url failed with status ${response.statusCode}: ${response.body}");
    }
  }
}
