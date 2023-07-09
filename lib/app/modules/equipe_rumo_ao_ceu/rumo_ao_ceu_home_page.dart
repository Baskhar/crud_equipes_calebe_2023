import 'package:calebe2023/app/modules/equipe_rumo_ao_ceu/controller/rumo_ao_ceu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';


class RumoAoCeuHomePage extends StatefulWidget {
  const RumoAoCeuHomePage({Key? key}) : super(key: key);

  @override
  State<RumoAoCeuHomePage> createState() => _RumoAoCeuHomePageState();
}

class _RumoAoCeuHomePageState extends State<RumoAoCeuHomePage> {
  final controller = Modular.get<RumoAoCeuController>();
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
            return Text('Pontuação: $pontuacao');
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
                Modular.to.pushNamed('/rumo_ao_ceu/lista_membros');
              },
              child: Text('Lista de membros'),
            ),
            ElevatedButton(
              onPressed: () async {
                await Modular.to.pushNamed('/rumo_ao_ceu/registro_pontuacao');
                await controller.consultaPontuacao();
                setState(() {});
              },
              child: Text('Adicionar pontuação'),
            ),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/rumo_ao_ceu/pontuacao');
              },
              child: Text('Registro das pontuações'),
            ),
          ],
        ),
      ),
    );
  }
}
