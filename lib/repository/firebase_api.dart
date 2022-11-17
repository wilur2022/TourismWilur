import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourismwilur/models/userApp.dart';

import '../models/tourist_sites.dart';

class FirebaseApi{
  Future<String?> registerUser(String email, String password) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user?.uid;
    }on FirebaseAuthException catch (e){
      print("FirebaseAuthExceptionWilur ${e.code}");
      return e.code;
    }on FirebaseException catch (e){
      print("FirebaseExceptionWilur ${e.code}");
      return e.code;
    }
  }

  Future<String> createUser(UserApp user) async {
    try {
      final document = await FirebaseFirestore.instance.collection("Users").doc(user.uid).set(user.toJson());
      return user.uid;
    } on FirebaseException catch (e) {
      print("FirebaseExceptionWilur ${e.code}");
      return e.code;
    }
  }

  Future<String?> logInUser(String email, String password) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return credential.user?.uid;
    }on FirebaseAuthException catch (e){
      print("FirebaseAuthExceptionWilur ${e.code}");
      return e.code;
    }on FirebaseException catch (e){
      print("FirebaseExceptionWilur ${e.code}");
      return e.code;
    }
  }

  Future<String> createTouristSites(TouristSites touristSites) async {
    try {
      final document = await FirebaseFirestore.instance.collection("TouristSites").doc(touristSites.idTs).set(touristSites.toJson());
      return touristSites.idTs;
    } on FirebaseException catch (e) {
      print("FirebaseExceptionWilur ${e.code}");
      return e.code;
    }
  }

}