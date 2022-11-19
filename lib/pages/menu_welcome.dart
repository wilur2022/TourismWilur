import 'package:flutter/material.dart';
import 'package:tourismwilur/touristSites/iglesia_san_francisco.dart';
import 'package:tourismwilur/touristSites/parque_quijote.dart';
import '../touristSites/puente_humilladero.dart';
import '../touristSites/virgen_lajas.dart';
import '../touristSites/virgen_playa.dart';
import 'login_page.dart';


class MenuWelcome extends StatelessWidget {
  const MenuWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent
            ),
            child: Image(image: AssetImage('assets/images/turismo.png')),
          ),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.church_outlined, size: 20, color: Colors.lightBlue,),
                title: const Text("Santuario Virgen de las Lajas", style: TextStyle(fontSize: 20),),
                textColor: Colors.green,
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const VirgenLajas()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.church_outlined, size: 20, color: Colors.lightBlue,),
                title: const Text("Santuario Virgen de la Playa", style: TextStyle(fontSize: 20),),
                textColor: Colors.green,
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const VirgenPlaya()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.church_outlined, size: 20, color: Colors.lightBlue,),
                title: const Text("Parque Don Quijote", style: TextStyle(fontSize: 20),),
                textColor: Colors.green,
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ParqueQuijote()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.church_outlined, size: 20, color: Colors.lightBlue,),
                title: const Text("Iglesia San Francisco", style: TextStyle(fontSize: 20),),
                textColor: Colors.green,
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const IglesiaSanFrancisco()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.church_outlined, size: 20, color: Colors.lightBlue,),
                title: const Text("Puente del Humilladero", style: TextStyle(fontSize: 20),),
                textColor: Colors.green,
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PuenteHumilladero()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app, size: 20, color: Colors.lightBlue,),
                title: const Text("Salir", style: TextStyle(fontSize: 20),),
                textColor: Colors.green,
                onTap: (){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
