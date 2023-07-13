import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController {
  final firestore = FirebaseFirestore.instance;
  final _pontuacaoStreamController = StreamController<List<int>>.broadcast();

  Stream<List<int>> get pontuacaoStream => _pontuacaoStreamController.stream;

  void carregarPontuacoes() {
    final equipe1Doc = firestore.collection('equipes').doc('os_guerreiros');
    final rumoAoCeuDoc = firestore.collection('equipes').doc('rumo_ao_ceu');

    equipe1Doc.snapshots().listen((equipe1Snapshot) {
      final pontuacaoEquipe1 = (equipe1Snapshot.data()?['pontuacao'] ?? 0) as int;

      rumoAoCeuDoc.snapshots().listen((rumoAoCeuSnapshot) {
        final pontuacaoRumoAoCeu = (rumoAoCeuSnapshot.data()?['pontuacao'] ?? 0) as int;

        final pontuacoes = [pontuacaoEquipe1, pontuacaoRumoAoCeu];
        _pontuacaoStreamController.add(pontuacoes);
      });
    });
  }

  void dispose() {
    _pontuacaoStreamController.close();
  }
}
