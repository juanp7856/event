import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 50, fontFamily: 'NicoMoji'),
        children: [
          TextSpan(
            text: 'E-V',
            style: TextStyle(color: Color.fromRGBO(122, 207, 212, 1))
          ),
          TextSpan(
            text: 'ENT',
            style: TextStyle(color: Colors.black)
          )
        ]
      )
    );
  }
}