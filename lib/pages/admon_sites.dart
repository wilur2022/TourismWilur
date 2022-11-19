import 'package:cloud_firestore/cloud_firestore.dart';
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: StreamBuilder<QuerySnapshot>(
            stream:
            FirebaseFirestore.instance.collection("TouristSites").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading');
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot site = snapshot.data!.docs[index];
                  return Card(
                    child: ListTile(
                      title: Text(site['name']),
                      subtitle: Text(site["location"]),
                    ),
                  );
                },
              );
            },
          ),
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
