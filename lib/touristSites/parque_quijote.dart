import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../pages/menu_site.dart';


class ParqueQuijote extends StatefulWidget {
  const ParqueQuijote({Key? key}) : super(key: key);

  @override
  State<ParqueQuijote> createState() => _ParqueQuijoteState();
}

class _ParqueQuijoteState extends State<ParqueQuijote> {

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
                .collection("TouristSites").where('idTs', isEqualTo: "PDQ")
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
                  const Text("ESCULTURA CENTRAL DEL PARQUE",textAlign:TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pink)),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/tourismwilur.appspot.com/o/ParqueQuijote%2Fparque3.jpg?alt=media&token=93c90906-3694-429d-b943-35892ab76f9a"),
                  const Divider(
                    height: 25,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.tealAccent,
                  ),
                  const Text("FOTO PARQUE LATERAL",textAlign:TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pink)),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/tourismwilur.appspot.com/o/ParqueQuijote%2Fparque2.jpg?alt=media&token=a45acf1e-dbe1-4348-91dc-05f8e2b67c8f"),
                  const Divider(
                    height: 25,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.tealAccent,
                  ),
                  const Text("FOTO CENTRAL DEL PARQUE",textAlign:TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pink)),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/tourismwilur.appspot.com/o/ParqueQuijote%2Fparque1.jpg?alt=media&token=e3b420fc-b7bc-4b7a-a401-c4d592c7ca4f")

                ],
              );
            },
          )),
    );
  }
}
