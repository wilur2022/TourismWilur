import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../pages/menu_site.dart';

class VirgenLajas extends StatefulWidget {
  const VirgenLajas({Key? key}) : super(key: key);

  @override
  State<VirgenLajas> createState() => _VirgenLajasState();
}

class _VirgenLajasState extends State<VirgenLajas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Santuario de la Virgen de las Lajas",textAlign:TextAlign.center,style: TextStyle(
          color: Colors.white,
          fontSize: 16,

        )),
      ),
      drawer: const MenuSite(),

      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("TouristSites").where('idTs', isEqualTo: "VDLL")
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
                  const Text("PANORÁMICA NOCTURNA DEL SANTUARIO",textAlign:TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pink)),
                  Image.network(site['photos'][2]),
                  const Divider(
                    height: 25,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.tealAccent,
                  ),
                  const Text("ALTAR PRINCIPAL DEL SANTUARIO",textAlign:TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pink)),
                  Image.network(site['photos'][3]),
                  const Divider(
                    height: 25,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.tealAccent,
                  ),
                  const Text("PANORÁMICA FRONTAL DEL SANTUARIO",textAlign:TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pink)),
                  Image.network(site['photos'][1])

                ],
              );
            },
          )),
    );
  }
}
