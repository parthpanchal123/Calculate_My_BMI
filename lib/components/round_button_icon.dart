import 'package:flutter/material.dart';
import '../constants.dart';

class roundButtonIcon extends StatelessWidget {
  roundButtonIcon({@required this.icon, this.operate});

  final IconData icon;
  final Function operate;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: operate,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}
