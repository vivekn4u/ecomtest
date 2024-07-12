import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

///this module will help manage and inject the objects from other packages
@module
abstract class InjectionModules {
  //inject http object
  @injectable
  http.Client get clientHttp => http.Client();

  @injectable
  FirebaseFirestore get firebaseFireStore => FirebaseFirestore.instance;

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}
