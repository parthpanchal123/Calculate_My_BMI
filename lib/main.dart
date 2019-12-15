import 'package:flutter/material.dart';
import 'screens/Inputpage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF080c22),
          scaffoldBackgroundColor: Color(0xFF080c22)),

      home: InputPage(),
    );
  }
}
