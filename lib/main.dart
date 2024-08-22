import 'package:european_countries_app/screens/home.dart';
import 'package:flutter/material.dart';

import 'package:european_countries_app/screens/welcom.dart';


void main (){
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    );
  }
}