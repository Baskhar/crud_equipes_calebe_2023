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
    final themeData = Theme.of(context);
    final largura = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: themeData.secondaryHeaderColor,
        centerTitle: true,
        title: Observer(
          builder: (_) {
            final pontuacao = controller.pontuacao;
            return Text('Pontuação Rumo ao céu: $pontuacao');
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width:  largura - 100,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Modular.to.pushNamed('/rumo_ao_ceu/lista_membros');
                },
                child: Text('Lista de membros'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeData.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width:  largura - 100,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                   Modular.to.pushNamed('/rumo_ao_ceu/registro_pontuacao');
                  controller.consultaPontuacao();
                  setState(() {});
                },
                child: Text('Adicionar pontuação'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeData.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width:  largura - 100,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Modular.to.pushNamed('/rumo_ao_ceu/pontuacao');
                },
                child: Text('Registro das pontuações'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeData.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
