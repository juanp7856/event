import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final press;
  final Color color, textColor;

  const CustomButton({
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        press;
        print('BOTON EJECTUADO');
      }, 
      child: Text('Botón')
      );
  }
}