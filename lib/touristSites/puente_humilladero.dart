import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../pages/menu_site.dart';

class PuenteHumilladero extends StatefulWidget {
  const PuenteHumilladero({Key? key}) : super(key: key);

  @override
  State<PuenteHumilladero> createState() => _PuenteHumilladeroState();
}

class _PuenteHumilladeroState extends State<PuenteHumilladero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("PARQUE DON QUIJOTE",textAlign:TextAlign.center,style: TextStyle(
          color: Colors.white,
          fontSize: 16,

        )),
      ),
      drawer: const MenuSite(),

      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("TouristSites").where('idTs', isEqualTo: "PDH")
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading');
              QueryDocumentSnapshot site = snapshot.data!.docs[0];
              return ListView(
                children: [

                  const Divider(
                    height: 25,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.tealAccent,
                  ),
                  const Text("DESCRIPCION:",textAlign:TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pink)),
                  Text(site['description'],textAlign:TextAlign.justify,),

                  const Divider(
                    height: 25,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.tealAccent,
                  ),
                  const Text("UBICACION GEOGRAFICA:",textAlign:TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pink)),
                  Text(site['location'],textAlign:TextAlign.justify,),

                  const Divider(
                    height: 25,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.tealAccent,
                  ),
                  const Text("VISTA GENERAL DEL PARQUE",textAlign:TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pink)),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/tourismwilur.appspot.com/o/puenteHumilladero%2Fph1.jpg?alt=media&token=f26e86ee-8b40-44af-a7bf-5a7da8a52ee3"),
                  const Divider(
                    height: 25,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.tealAccent,
                  ),
                  const Text("VISTA LATERAL DEL PARQUE",textAlign:TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pink)),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/tourismwilur.appspot.com/o/puenteHumilladero%2Fph2.jpg?alt=media&token=4573aa8c-9297-481e-aa66-7c92a1372906"),
                  const Divider(
                    height: 25,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.tealAccent,
                  ),
                  const Text("VISTA NOCTURNA NAVIDEÑA DEL PARQUE",textAlign:TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pink)),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/tourismwilur.appspot.com/o/puenteHumilladero%2Fph3.jpg?alt=media&token=18153ea6-541c-4d1b-85a0-a2c58c49165f"),
                  const Divider(
                    height: 25,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.tealAccent,
                  ),
                  const Text("VISTA CENTRAL DEL PARQUE",textAlign:TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pink)),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/tourismwilur.appspot.com/o/puenteHumilladero%2Fph4.jpg?alt=media&token=11ee43f3-6263-470b-a2b3-524af7cb9ef3"),
                  const Divider(
                    height: 25,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.tealAccent,
                  ),
                  const Text("VISTA NAVIDEÑA DEL PARQUE",textAlign:TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pink)),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/tourismwilur.appspot.com/o/puenteHumilladero%2Fph5.jpg?alt=media&token=a1b94258-e21c-4948-a1a6-80fbbf9bfcdf")
                ],
              );
            },
          )),
    );
  }
}
