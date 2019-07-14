import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/register.dart';
import './pages/lapor.dart';

void main(){
  runApp(UASAgushm());
}

class UASAgushm extends StatefulWidget {
  @override
  _UASAgushmState createState() => _UASAgushmState();
}

class _UASAgushmState extends State<UASAgushm> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.light,
        fontFamily: 'All'
      ),
      routes: {
        '/':(BuildContext context) => HomePage(),
        '/register':(BuildContext context) => RegisterPage(),
         '/lapor':(BuildContext context) => LaporPage(),
      },

    );
  }
}