import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home_module/controller/home_controller.dart';
import 'controller/os_guerreiros_controller.dart';


class OsGuerreirosHomePage extends StatefulWidget {
  const OsGuerreirosHomePage({Key? key}) : super(key: key);

  @override
  State<OsGuerreirosHomePage> createState() => _OsGuerreirosHomePageState();
}

class _OsGuerreirosHomePageState extends State<OsGuerreirosHomePage> {
  final controller = Modular.get<OsGuerreirosController>();
  final controller2 = HomeController();
  @override
  void initState() {
    super.initState();
    controller.consultaPontuacao();
    print('olaaaaaaaaaaaaaaaa');
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
   // controller2.carregarPontuacoes();
  }

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: themeData.secondaryHeaderColor,
        centerTitle: true,
        title: Observer(
          builder: (_) {
            final pontuacao = controller.pontuacao;
            return Text('Pontuação dos Guerreiros: $pontuacao',style: TextStyle(
              fontWeight: FontWeight.bold,
              color: themeData.secondaryHeaderColor
            ),);
          },
        ),
      ),
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: largura -100,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Modular.to.pushNamed('/equipe1/lista_membros');
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
              width: largura -100,
              height: 50,
              child: ElevatedButton(
                onPressed: ()  async{
                   Modular.to.pushNamed('/equipe1/registro_pontuacao');
                  await controller.consultaPontuacao();
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
              width: largura -100,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Modular.to.pushNamed('/equipe1/pontuacao');
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
