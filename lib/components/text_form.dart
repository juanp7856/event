import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String validate;
  final height;

  const TextForm({
    required this.labelText,
    required this.hintText,
    required this.validate,
    required this.height
  });

  validar (value) {
    if (validate == 'correo') {
      print(value);
      if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)){
        return 'Ingresa un correo correcto';
      } else {
        return null;
      }
    } else if (validate == 'nombres') {
      print(value);
      if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
        return 'Ingresa un nombre correcto';
      } else {
        return null;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(labelText, style: TextStyle(fontFamily: 'RobotoSerif', fontSize: 16)),
        ),
        SizedBox(height: height * 0.005),
        SizedBox(height: height * 0.055, 
          child: TextFormField(
            style: TextStyle(fontFamily: 'RobotoSerif'),
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              filled: true,
              fillColor: Colors.grey[400],
            ),
            cursorColor: Colors.black,
            validator: (value) {
              validar(value);
            }
        ))
        
      ]
      );
  }
}