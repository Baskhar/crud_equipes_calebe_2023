import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'equipe1_controller.g.dart';

class Equipe1Controller = _Equipe1Controller with _$Equipe1Controller;
abstract class _Equipe1Controller with Store{
  //final FirebaseFirestore firestore = Modular.get<FirebaseFirestore>();
  final firestore = FirebaseFirestore.instance;
  @observable
  int pontuacao = 0;

  @computed
  int get getPontuacao => pontuacao;

  _Equipe1Controller() {
    _init();
  }

  @action
  Future<void> _init() async {
    await consultaPontuacao();
    autorun((_) {
      print('Pontuação atualizada: $pontuacao');
    });
  }
  @observable
  ObservableList<String> membros = ObservableList<String>();

  @observable
  bool loading = false;

  @observable
  bool error = false;



  Future<void> inserirMembro({required String nome}) async {

    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
      await firestore.collection('equipes').doc('equipe1').get();

      final List<dynamic> membros = snapshot.data()?['membros'];

      membros.add(nome);

      await firestore.collection('equipes').doc('equipe1').update({
        'membros': membros,
      });

      print('Nome inserido com sucesso');
    } catch (e) {
      print('Erro ao inserir nome: $e');
    }
  }
  @action
  Future<void> listaEquipe1() async {
    loading = true;
    try {
      final snapshot =
      await firestore.collection('equipes').doc('equipe1').get();
      final membrosData = snapshot.data()?['membros'] as List<dynamic>?;
      membros = ObservableList<String>.of(
          membrosData?.map<String>((membro) => membro.toString()) ?? []);
      error = false;
    } catch (e) {
      print('Erro ao obter membros: $e');
      error = true;
    } finally {
      loading = false;
    }
  }
  @action
  Future<void> editarMembro({required int index, required String novoNome}) async {
    loading = true;
    try {
      final snapshot = await firestore.collection('equipes').doc('equipe1').get();
      final membrosData = snapshot.data()?['membros'] as List<dynamic>?;
      if (membrosData != null) {
        membrosData[index] = novoNome;
        await firestore.collection('equipes').doc('equipe1').update({'membros': membrosData});
        membros[index] = novoNome;
      }
      error = false;
    } catch (e) {
      print('Erro ao editar membro: $e');
      error = true;
    } finally {
      loading = false;
    }
  }





  @action
  Future<void> inserirPontuacao({required int pontuacao}) async {
    try {
      final equipe1Ref = firestore.collection('equipes').doc('equipe1');

      await firestore.runTransaction((transaction) async {
        final snapshot = await transaction.get(equipe1Ref);
        final existingPontuacao = snapshot.data()?['pontuacao'] ?? 0;
        final newPontuacao = existingPontuacao + pontuacao;
        transaction.update(equipe1Ref, {'pontuacao': newPontuacao});
      });

      print('Pontuação atualizada com sucesso');
    } catch (e) {
      print('Erro ao atualizar pontuação: $e');
    }
  }


  @action
  Future<void> consultaPontuacao() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
      await firestore.collection('equipes').doc('equipe1').get();
      final pontuacao = snapshot.data()?['pontuacao'];
      this.pontuacao = pontuacao ?? 0;
    } catch (e) {
      print('Erro ao consultar pontuação: $e');
      this.pontuacao = 0;
    }
  }


  Future<void> registroPontuacao({required int ponto,required String data,required String detalhes}) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
      await firestore.collection('equipes').doc('equipe1').get();

      final List<dynamic> registros = snapshot.data()?['registros'];

      registros.add({
        'ponto': ponto,
        'data': data,
        'detalhes': detalhes,
      });

      await firestore.collection('equipes').doc('equipe1').update({
        'registros': registros,
      });

      print('Registro de pontuação adicionado com sucesso');
    } catch (e) {
      print('Erro ao adicionar registro de pontuação: $e');
    }
  }
  Future<List<Map<String, dynamic>>> getPontuacoes() async {
    try {
      final equipe1Ref = firestore.collection('equipes').doc('equipe1');
      final snapshot = await equipe1Ref.get();

      if (snapshot.exists) {
        final data = snapshot.data();
        if (data != null) {
          final pontuacoes = data['registros'] as List<dynamic>?;

          if (pontuacoes != null) {
            return pontuacoes.cast<Map<String, dynamic>>();
          }
        }
      }

      return [];
    } catch (e) {
      print('Erro ao obter pontuações: $e');
      return [];
    }
  }

  @action
  Future<void> removerMembro({required String nome}) async {
    try {
      final equipe1Ref = firestore.collection('equipes').doc('equipe1');

      await firestore.runTransaction((transaction) async {
        final snapshot = await transaction.get(equipe1Ref);
        final membros = snapshot.data()?['membros'] as List<dynamic>?;
        membros?.remove(nome);
        transaction.update(equipe1Ref, {'membros': membros});
      });

      print('Membro removido com sucesso');
    } catch (e) {
      print('Erro ao remover membro: $e');
    }
  }


}
