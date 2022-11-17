import 'package:flutter/material.dart';
import 'package:tourismwilur/pages/new_tourist_site.dart';
import 'package:tourismwilur/pages/welcome_page.dart';
import '../repository/firebase_api.dart';
import 'register_page.dart';
import '../validations/validated_login.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseApi _firebaseApi = FirebaseApi();
  final _email = TextEditingController();
  final _password = TextEditingController();


  void _showMessage(String message){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: Text(message),
        backgroundColor: Colors.cyan,
        duration: const Duration(seconds: 8),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _onValidatedButtonClicked() async {
    String validate = validatedLogin().EntryIsValidated(_email, _password);
    if(validate=="Validated"){
      var result = await _firebaseApi.logInUser(_email.text, _password.text);
      String message = "";
      if ( result=="wrong-password"){
        message= "Email o Contrseña Incorrecta";
      }else
      if ( result=="network-request-failed"){
        message= "Revise su conexion a INTERNET";
      }else
      if ( result=="user-not-found"){
        message= "Usuario NO Registrado. Registrate dando CLICK en Registrarse";
      }else if(_email.text=='wilsonurbano2011@hotmail.com'){
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NewTouristSites()));
      }else{
        message = "BIENVENIDO A TURISMO FACIL";
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomePage()));
      }
      _showMessage(message);

    }else{
      _showMessage(validate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("TURISMO WILUR"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(image: AssetImage('assets/images/login.png')),

                  //Entry user
                  const SizedBox(
                    height: 12.0,
                  ),

                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Escribe tu Correo electrónico',
                        suffixIcon: Icon(Icons.account_box_outlined)
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  //Entry password
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextFormField(
                    controller: _password,
                    maxLength: 8,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Escribe tu Contraseña',
                        suffixIcon: Icon(Icons.ac_unit)
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),

                  //Button de Iniciar Sesion
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16)),
                    onPressed: () {
                      _onValidatedButtonClicked();
                    },
                    child: const Text("Iniciar Sesión"),
                  ),

                  //Button de Registrarse
                  TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.purpleAccent)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    child: const Text("Registrarse"),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}


