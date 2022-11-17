import 'package:flutter/material.dart';
import 'package:tourismwilur/pages/menu_welcome.dart';
import 'new_tourist_site.dart';


class AdmonSites extends StatefulWidget {
  const AdmonSites({Key? key}) : super(key: key);

  @override
  State<AdmonSites> createState() => _AdmonSitesState();
}

class _AdmonSitesState extends State<AdmonSites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("TURISMO WILUR"),
        ),
        drawer: const MenuWelcome(),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Text("Completar")
        ),

        //Button de Registrar nuevo sitio turistico
        floatingActionButton: FloatingActionButton(

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const NewTouristSites()));
          },
          tooltip: 'Nuevo Sitio',
          child: const Text("New"),

        )





    );
  }
}
