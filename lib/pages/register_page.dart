import 'package:event/components/logo_text.dart';
import 'package:event/responsive/desktopBody.dart';
import 'package:event/responsive/mobileBody.dart';
import 'package:event/responsive/responsiveLayout.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>(); // key para el formulario
  String _password = "";

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileBody(
          body: Scaffold(
            body: SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(currentHeight * 0.075)),
                  Center(child: LogoText()),
                  Padding(
                    padding: EdgeInsets.only(top: currentHeight * 0.02),
                    child: Center(child: 
                      Text('Ingrese sus datos para iniciar sesión', style: TextStyle(fontFamily: 'RobotoSerif', fontSize: 16))
                  )),
                  SizedBox(height: currentHeight * 0.03),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          //FORMULARIOS
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Nombres y Apellidos', style: TextStyle(fontFamily: 'RobotoSerif', fontSize: 16)),
                              ),

                              SizedBox(height: currentHeight * 0.005),
                              
                              TextFormField(
                                style: TextStyle(fontFamily: 'RobotoSerif'),
                                decoration: InputDecoration(
                                  hintText: 'Ingrese sus nombres y apellidos',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                  filled: true,
                                  fillColor: Colors.grey[400],
                                ),
                                cursorColor: Colors.black,
                                validator: (value) {
                                  if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                                    return 'Ingresa un nombre correcto.';
                                  } else {
                                    return null;
                                  }
                                }
                              ),

                              SizedBox(height: currentHeight * 0.005),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Correo Electrónico', style: TextStyle(fontFamily: 'RobotoSerif', fontSize: 16)),
                              ),

                              SizedBox(height: currentHeight * 0.005),
                              
                              TextFormField(
                                style: TextStyle(fontFamily: 'RobotoSerif'),
                                decoration: InputDecoration(
                                  hintText: 'Ingrese su correo',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                  filled: true,
                                  fillColor: Colors.grey[400],
                                ),
                                cursorColor: Colors.black,
                                validator: (value) {
                                  if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)){
                                    return 'Ingresa un correo correcto.';
                                  } else {
                                    return null;
                                  }
                                }
                              ),
                              
                              SizedBox(height: currentHeight * 0.005),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Contraseña', style: TextStyle(fontFamily: 'RobotoSerif', fontSize: 16)),
                              ),

                              SizedBox(height: currentHeight * 0.005),
                              
                              TextFormField(
                                style: TextStyle(fontFamily: 'RobotoSerif'),
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Ingrese su contraseña',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                  filled: true,
                                  fillColor: Colors.grey[400],
                                ),
                                cursorColor: Colors.black,
                                onChanged: (value){
                                  setState(() {
                                    _password = value;
                                  });
                                },
                                validator: (value) {
                                  if(value!.isEmpty || !RegExp(r'^(?=.*[a-z])(?=.*\d)[a-zA-Z\d]{8,}$').hasMatch(value)){
                                    return 'Mínimo 8 carácteres y al menos un número.';
                                  } else {
                                    return null;
                                  }
                                }
                              ),

                              SizedBox(height: currentHeight * 0.005),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Confirmar Contraseña', style: TextStyle(fontFamily: 'RobotoSerif', fontSize: 16)),
                              ),

                              SizedBox(height: currentHeight * 0.005),
                              
                              TextFormField(
                                style: TextStyle(fontFamily: 'RobotoSerif'),
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Ingrese su contraseña',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                  filled: true,
                                  fillColor: Colors.grey[400],
                                ),
                                cursorColor: Colors.black,
                                validator: (value) {
                                  if(value!.isEmpty || !RegExp(r'^(?=.*[a-z])(?=.*\d)[a-zA-Z\d]{8,}$').hasMatch(value)){
                                    return 'Mínimo 8 carácteres y al menos un número.';
                                  } else if (value != _password) {
                                    return 'Ambas contraseñas deben coincidir';
                                  } else {
                                    return null;
                                  }
                                }
                              )
                            ]
                          ),
                          
                          SizedBox(height: currentHeight * 0.03),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25, right: 25),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(122, 207, 212, 1),
                                  minimumSize: Size.fromHeight(currentHeight * 0.05)
                                ),
                                onPressed: (){
                                  if(formKey.currentState!.validate()){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Funciona'))
                                    );
                                  }
                                }, 
                                child: Text('Registrarme', style: TextStyle(color: Colors.black, fontFamily: 'RobotoSerif'))
                              ),
                            ),
                          ),
                        ]
                        ),
                    )
                  ),
            
                  
                ]
                ,
              ),
            )
            )
          ), 



          
        desktopBody: DesktopBody(body : Scaffold())
        ),
    );
  }
}