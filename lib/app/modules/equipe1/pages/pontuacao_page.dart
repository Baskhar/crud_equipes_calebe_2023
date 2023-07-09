import 'package:flutter/material.dart';
import 'package:calebe2023/app/modules/equipe1/controller/equipe1_controller.dart';

class PontuacaoPage extends StatelessWidget {
  final controller = Equipe1Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                          Text('Data: $data'),
                          const SizedBox(height: 4),
                          Text('Detalhes: $detalhes'),
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