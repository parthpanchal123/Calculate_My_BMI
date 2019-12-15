import 'package:flutter/material.dart';
import '../constants.dart';

class bottom_button extends StatelessWidget {
  bottom_button({@required this.onTap, this.btn_title});
  final String btn_title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(btn_title, style: large_text_style),
        ),
        height: 80.0,
        width: double.infinity,
        margin: EdgeInsets.only(top: 17.0),
        color: Color(0xFFeb1556),
      ),
    );
  }
}
