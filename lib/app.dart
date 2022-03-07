import 'package:flutter/material.dart';
import 'package:lrnr_demo/home/view/home_view.dart';
import 'package:lrnr_demo/util/color_util.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: generateMaterialColor(const Color(0xffFF1A1A)),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Montserrat'),
      home: HomeScreen(),
    );
  }
}
