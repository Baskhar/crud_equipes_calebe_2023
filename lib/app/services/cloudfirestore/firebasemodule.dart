import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirebaseModule extends Module {
  @override
  final List<Bind> binds = [
    // Singleton instance of FirebaseFirestore
    Bind.singleton((i) => FirebaseFirestore.instance),
  ];
}
