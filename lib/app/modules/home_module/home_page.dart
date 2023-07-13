import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.carregarPontuacoes();
  }
  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.appBarTheme.backgroundColor,
        centerTitle: true,
        title: Text(
          'Equipes Calebe',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: themeData.secondaryHeaderColor,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: largura - 100,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/equipe1');
              },
              child: Text("Os Guerreiros"),
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
            width: largura - 100,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/rumo_ao_ceu');
              },
              child: Text("Equipe Rumo ao Céu"),
              style: ElevatedButton.styleFrom(
                backgroundColor: themeData.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          StreamBuilder<List<int>>(
            stream: controller.pontuacaoStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Erro ao carregar as pontuações'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              final pontuacoes = snapshot.data!;
              final pontuacaoEquipe1 = pontuacoes[0];
              final pontuacaoRumoAoCeu = pontuacoes[1];
              String equipeComMaisPontos = '';
              if (pontuacaoEquipe1 > pontuacaoRumoAoCeu) {
                equipeComMaisPontos = 'Os Guerreiros';
              } else if (pontuacaoEquipe1 < pontuacaoRumoAoCeu) {
                equipeComMaisPontos = 'Equipe Rumo ao Céu';
              }

              return Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Pontuação Os Guerreiros: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '$pontuacaoEquipe1',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: ' / ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Pontuação Equipe Rumo ao Céu: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '$pontuacaoRumoAoCeu',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                        WidgetSpan(
                          child: Container(height: 16),
                        ),
                        WidgetSpan(
                          child: Text(
                            'Equipe Vencedora: $equipeComMaisPontos',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );


            },
          ),
          // IconButton(onPressed: (){
          //
          //   setState(() {
          //
          //   });
          // }, icon: Icon(Icons.abc))
        ],
      ),
    );
  }
}
