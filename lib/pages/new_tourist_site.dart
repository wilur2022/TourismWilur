import 'package:flutter/material.dart';
import 'package:tourismwilur/pages/welcome_page.dart';
import '../models/tourist_sites.dart';
import '../repository/firebase_api.dart';

class NewTouristSites extends StatefulWidget {
  const NewTouristSites({Key? key}) : super(key: key);

  @override
  State<NewTouristSites> createState() => _NewTouristSitesState();
}

class _NewTouristSitesState extends State<NewTouristSites> {
  final FirebaseApi _firebaseApi = FirebaseApi();

  final _name = TextEditingController();
  final _photos = TextEditingController();
  final _idTs = TextEditingController();
  final _location = TextEditingController();
  final _description = TextEditingController();


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

  void _saveTouristSites(TouristSites touristSites) async{
    var result = await _firebaseApi.createTouristSites(touristSites);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomePage()));
  }

  void _onTouristSitesButtonClicked() {
    setState(() {
      var newTouristSites = TouristSites(_idTs.text,_name.text, _photos.text, _location.text,_description.text);
      _saveTouristSites(newTouristSites);
      _showDialogMessage("Sitio Turistico creado con exito");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("NUEVO SITIO TURISTICO"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(image: AssetImage('assets/images/login.png')),

                  //Entry idTs
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextFormField(
                    controller: _idTs,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Id del sitio Turistico',
                        suffixIcon: Icon(Icons.accessibility_new)),
                    keyboardType: TextInputType.text,
                  ),

                  //Entry name
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nombre sitio turistico',
                        suffixIcon: Icon(Icons.accessibility_new)),
                    keyboardType: TextInputType.text,
                  ),

                  //Entry photos
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextFormField(
                    controller: _photos,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Pega aqui la URL de la iamgen',
                        suffixIcon: Icon(Icons.ad_units_outlined)),
                    keyboardType: TextInputType.text,

                  ),

                  //Entry location
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextFormField(
                    controller: _location,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Localizacion del sitio turistico'),
                    keyboardType: TextInputType.text,
                  ),

                  //Entry _description
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextFormField(
                    controller: _description,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Breve descripcion del sitio turistico'),
                    keyboardType: TextInputType.text,
                  ),


                  const SizedBox(
                    height: 14.0,
                  ),

                  //Button de Registrarse
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      shadowColor: Colors.green,
                      textStyle: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16),
                    ),
                    onPressed: () {
                      _onTouristSitesButtonClicked();
                    },
                    child: const Text("GUARDAR SITIO TURISTICO"),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
