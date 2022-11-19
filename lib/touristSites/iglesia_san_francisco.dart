import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../pages/menu_site.dart';


class IglesiaSanFrancisco extends StatefulWidget {
  const IglesiaSanFrancisco({Key? key}) : super(key: key);

  @override
  State<IglesiaSanFrancisco> createState() => _IglesiaSanFranciscoState();
}

class _IglesiaSanFranciscoState extends State<IglesiaSanFrancisco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("IGLESIA SAN FRANCISCO",textAlign:TextAlign.center,style: TextStyle(
          color: Colors.white,
          fontSize: 16,

        )),
      ),
      drawer: const MenuSite(),

      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("TouristSites").where('idTs', isEqualTo: "ISF")
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
                  const Text("VISTA FRONTAL DE LA IGLESIA",textAlign:TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pink)),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/tourismwilur.appspot.com/o/IglesiaSanFrancisco%2Fisf2.jpg?alt=media&token=61973830-7b11-415b-aaef-8745b0126795"),
                  const Divider(
                    height: 25,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.tealAccent,
                  ),
                  const Text("ALTAR PRINCIPAL",textAlign:TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pink)),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/tourismwilur.appspot.com/o/IglesiaSanFrancisco%2Fisf3.jpg?alt=media&token=dc8e283d-0ac8-426e-babf-8ff823ff6351"),
                  const Divider(
                    height: 25,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.tealAccent,
                  ),
                  const Text("ALTAR SAN FRANCISCO",textAlign:TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pink)),
                  Image.network("https://firebasestorage.googleapis.com/v0/b/tourismwilur.appspot.com/o/IglesiaSanFrancisco%2Fisf4.jpg?alt=media&token=44027fa8-cccb-4771-bed7-d20c47b1a1ce")

                ],
              );
            },
          )),
    );
  }
}
