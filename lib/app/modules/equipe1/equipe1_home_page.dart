import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controller/equipe1_controller.dart';


class Equipe1HomePage extends StatefulWidget {
  const Equipe1HomePage({Key? key}) : super(key: key);

  @override
  State<Equipe1HomePage> createState() => _Equipe1HomePageState();
}

class _Equipe1HomePageState extends State<Equipe1HomePage> {
  final controller = Modular.get<Equipe1Controller>();

  @override
  void initState() {
    super.initState();
    controller.consultaPontuacao();
    print('olaaaaaaaaaaaaaaaa');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Observer(
          builder: (_) {
            final pontuacao = controller.pontuacao;
            return Text('Pontuação da equipe 1: $pontuacao');
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/equipe1/lista_membros');
              },
              child: Text('Lista de membros'),
            ),
            ElevatedButton(
              onPressed: () async {
                await Modular.to.pushNamed('/equipe1/registro_pontuacao');
                await controller.consultaPontuacao();
                setState(() {});
              },
              child: Text('Adicionar pontuação'),
            ),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/equipe1/pontuacao');
              },
              child: Text('Registro das pontuações'),
            ),
          ],
        ),
      ),
    );
  }
}
