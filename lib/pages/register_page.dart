import 'package:flutter/material.dart';
import 'package:tourismwilur/models/userApp.dart';
import '../repository/firebase_api.dart';
import '../validations/validated_register.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseApi _firebaseApi = FirebaseApi();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repeatpassword = TextEditingController();

  void _showDialogMessage(String message){
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("INFORMACION IMPORTANTE",
            style: TextStyle(
                fontSize: 16, fontStyle: FontStyle.italic, color: Colors.red)),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.cyan,
              padding: const EdgeInsets.all(14),
              child: const Text("OK"),
            ),
          ),
        ],
        content: Text(message),
      ),
    );
  }

  void _saveUser(UserApp user) async{
    var result = await _firebaseApi.createUser(user);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void _registerUser(UserApp user) async{
    String msg = "";
    var result = await _firebaseApi.registerUser(user.email, user.password);
    if ( result=="email-already-in-use"){
      msg= "Ya existe un usuario registrado con ese Email.";
    }else
    if ( result=="network-request-failed"){
      msg= "Revise su conexion a INTERNET";
    }else {
      user.uid = result;
      msg = "Usuario REGISTRADO con exito";
      // ignore: use_build_context_synchronously
      _saveUser(user);
    }
    _showDialogMessage(msg);
  }

  void _onRegisterButtonClicked() {
    String validation = validateEntry().EntryIsValidated(
        _name, _phone, _email, _password, _repeatpassword);
    setState(() {
      if (validation=="Validated"){
        var user = UserApp("",_name.text, _phone.text, _email.text, _password.text);
        _registerUser(user);
      }else{
        _showDialogMessage(validation);
      }
    });
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

                  //Entry name
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nombre completo',
                        suffixIcon: Icon(Icons.accessibility_new)),

                    keyboardType: TextInputType.text,
                  ),

                  //Entry phone
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextFormField(
                    controller: _phone,
                    maxLength: 10,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Teléfono o Celular',
                        suffixIcon: Icon(Icons.ad_units_outlined)),
                    keyboardType: TextInputType.phone,
                  ),

                  //Entry email
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Escribe tu Correo electrónico',
                        suffixIcon: Icon(Icons.mail_lock_outlined)),

                    keyboardType: TextInputType.emailAddress,
                  ),

                  //Entry password
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    maxLength: 8,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Escribe tu Contraseña',
                        suffixIcon: Icon(Icons.password)),
                    keyboardType: TextInputType.visiblePassword,
                  ),

                  //Entry repeatpassword
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextFormField(
                    controller: _repeatpassword,
                    obscureText: true,
                    maxLength: 8,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Reescribe tu Contraseña',
                        suffixIcon: Icon(Icons.password)),
                    keyboardType: TextInputType.visiblePassword,
                  ),

                  const SizedBox(
                    height: 14.0,
                  ),


                  //Button de Registrarse
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      shadowColor: Colors.green,
                      textStyle: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16),
                    ),
                    onPressed: () {
                      _onRegisterButtonClicked();
                    },
                    child: const Text("REGISTRAR DATOS"),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
