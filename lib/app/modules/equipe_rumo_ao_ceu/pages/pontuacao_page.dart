import 'package:calebe2023/app/modules/equipe_rumo_ao_ceu/controller/rumo_ao_ceu_controller.dart';
import 'package:flutter/material.dart';


class PontuacaoPageRumoAoCeu extends StatelessWidget {
  final controller = RumoAoCeuController();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: themeData.secondaryHeaderColor,
        title: const Text('Pontuações'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: controller.getPontuacoes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar as pontuações'),
            );
          } else {
            final pontuacoes = snapshot.data;

            if (pontuacoes != null && pontuacoes.isNotEmpty) {
              return ListView.builder(
                itemCount: pontuacoes.length,
                itemBuilder: (context, index) {
                  final pontuacao = pontuacoes[index];
                  final ponto = pontuacao['ponto'];
                  final data = pontuacao['data'];
                  final detalhes = pontuacao['detalhes'];

                  return Card(
                    color: themeData.primaryColor,
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(
                        'Pontuação: $ponto',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Data: $data',style: TextStyle(
                              color: Colors.black
                          ),),
                          const SizedBox(height: 4),
                          Text('Detalhes: $detalhes',style: TextStyle(
                              color: Colors.black
                          ),),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  'Nenhuma pontuação encontrada',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
