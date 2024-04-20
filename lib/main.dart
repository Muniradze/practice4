import 'dart:js';

import 'package:flutter/material.dart';
import 'package:mun_to_do/activities/home.dart';
import 'package:mun_to_do/activities/page2.dart';
import 'package:mun_to_do/activities/page1.dart';
import 'package:mun_to_do/activities/page3.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    //primaryColor: Colors.amber
  ),
  initialRoute: '/',
  routes:
    {
      '/': (context) => MainPage(),
      '/home': (context) => Home(),
      '/page2': (context) => Page2(),
      '/page3': (context) => Page3(),
    },
  )
);

