import 'package:event/components/logo_text.dart';
import 'package:event/pages/register_page.dart';
import 'package:event/responsive/desktopBody.dart';
import 'package:event/responsive/mobileBody.dart';
import 'package:event/responsive/responsiveLayout.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>(); // key para el formulario

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileBody(
          body: Scaffold(
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
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
                                validator: (value) {
                                  if(value!.isEmpty || !RegExp(r'^(?=.*[a-z])(?=.*\d)[a-zA-Z\d]{8,}$').hasMatch(value)){
                                    return 'Mínimo 8 carácteres y al menos un número.';
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
                                child: Text('Iniciar sesión', style: TextStyle(color: Colors.black, fontFamily: 'RobotoSerif'))
                              ),
                            ),
                          ),
                          SizedBox(height: currentHeight * 0.001),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25, right: 25),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                    width: 0.5,
                                    color: Colors.black
                                  ),
                                  primary: Colors.white,
                                  minimumSize: Size.fromHeight(currentHeight * 0.05)
                                ),
                                onPressed: (){
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => RegisterPage())
                                  );
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
        
        
