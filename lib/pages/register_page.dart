import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tourismwilur/models/userApp.dart';
import '../repository/firebase_api.dart';
import '../validations/validated_register.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
enum Nationality { colombiano, extranjero }

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseApi _firebaseApi = FirebaseApi();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repeatpassword = TextEditingController();
  Nationality? _nationality = Nationality.colombiano;
  bool _architectural = false;
  bool _religious = false;
  bool _cultural = false;
  bool _sunandbeach = false;
  String dateVacations = "2022-12-01";
  String buttonMsg = "FECHA FUTURAS VACACIONES";

  String _dateConverter(DateTime newdate){
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String dateFormatted = formatter.format(newdate);
    return dateFormatted;
  }
  void _showSelectDate() async{
    final DateTime? newDate = await showDatePicker(
      context: context,
      locale: const Locale("es", "CO"),
      initialDate: DateTime(2022,12),
      firstDate: DateTime(2022,12),
      lastDate: DateTime(2023,1),
      helpText: "Fecha Futuras vacaciones",
    );
    if (newDate != null){
      setState(() {
        dateVacations = _dateConverter(newDate);
        buttonMsg = "Fecha Futuras vacaciones: ${dateVacations.toString()}";
      });
    }

  }

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
    await _firebaseApi.createUser(user);
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
        String nationality = "COLOMBIANO";
        List<String> tourismFavorites = [];
        if (_nationality == Nationality.extranjero) {
          nationality = "EXTRANJERO";
        }
        if(_religious==true) {
          tourismFavorites.add("Religioso");
        }
        if(_cultural==true) {
          tourismFavorites.add("Cultural");
        }
        if(_sunandbeach==true) {
          tourismFavorites.add("Sol y Playa");
        }
        if(_architectural==true) {
          tourismFavorites.add("Arquitectonico");
        }


        var user = UserApp("",_name.text, _phone.text, _email.text, _password.text, nationality, tourismFavorites, dateVacations);
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
          title: const Text("TURISMO ONLINE"),
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
                  const Divider(
                    height: 25,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.tealAccent,
                  ),
                  const Text(
                    "NACIONALIDAD",
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  ),

                  //Seleccion de nacionalidad
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text(
                            'COLOMBIANO',
                            style: TextStyle(
                                fontSize: 12, fontStyle: FontStyle.italic),
                          ),
                          leading: Radio<Nationality>(
                            value: Nationality.colombiano,
                            groupValue: _nationality,
                            onChanged: (Nationality? value) {
                              setState(() {
                                _nationality = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text(
                            'EXTRANJERO',
                            style: TextStyle(
                                fontSize: 12, fontStyle: FontStyle.italic),
                          ),
                          leading: Radio<Nationality>(
                            value: Nationality.extranjero,
                            groupValue: _nationality,
                            onChanged: (Nationality? value) {
                              setState(() {
                                _nationality = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(
                    height: 25,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.tealAccent,
                  ),

                  const Text(
                    "Tipos de turismo que te gusta hacer",
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  ),

                  //Tipos de turismo
                  CheckboxListTile(
                    title: const Text("Turismo Arquitectonico"),
                    value: _architectural,
                    selected: _architectural,
                    onChanged: (bool? value) {
                      setState(() {
                        _architectural = value!;
                      });
                    },
                  ),

                  CheckboxListTile(
                    title: const Text("Turismo Religioso"),
                    value: _religious,
                    selected: _religious,
                    onChanged: (bool? value) {
                      setState(() {
                        _religious = value!;
                      });
                    },
                  ),

                  CheckboxListTile(
                    title: const Text("Turismo Cultural"),
                    value: _cultural,
                    selected: _cultural,
                    onChanged: (bool? value) {
                      setState(() {
                        _cultural = value!;
                      });
                    },
                  ),

                  CheckboxListTile(
                    title: const Text("Turismo Sol y Playa"),
                    value: _sunandbeach,
                    selected: _sunandbeach,
                    onChanged: (bool? value) {
                      setState(() {
                        _sunandbeach = value!;
                      });
                    },
                  ),


                  const Divider(
                    height: 25,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.tealAccent,
                  ),

                  //Button fecha de vacaciones
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16)),
                    onPressed: () {
                      _showSelectDate();
                    },
                    child: Text(buttonMsg),
                  ),

                  const Divider(
                    height: 25,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.tealAccent,
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
