import 'package:calebe2023/app/modules/equipe_rumo_ao_ceu/controller/rumo_ao_ceu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';



class ListaMembrosRumoAoCeu extends StatefulWidget {
  const ListaMembrosRumoAoCeu({Key? key}) : super(key: key);

  @override
  State<ListaMembrosRumoAoCeu> createState() => _ListaMembrosRumoAoCeuState();
}

class _ListaMembrosRumoAoCeuState extends State<ListaMembrosRumoAoCeu> {
  final controller = Modular.get<RumoAoCeuController>();

  @override
  void initState() {
    super.initState();
    controller.listaRumoAoCeu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.pushNamed(context, '/rumo_ao_ceu/cadastro_membro');
              controller.listaRumoAoCeu();
            },
            icon: Icon(Icons.add),
          ),
        ],
        title: Text('Lista de Membros'),
      ),
      body: Observer(
        builder: (context) {
          final members = controller.membros;
          if (controller.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.error) {
            return Center(child: Text('Erro ao carregar os membros'));
          } else if (members.isEmpty) {
            return Center(child: Text('Nenhum membro encontrado'));
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: members.length,
              itemBuilder: (context, index) {
                final member = members[index];
                return Dismissible(
                  key: Key(member),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    color: Colors.red,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onDismissed: (direction) async {
                    // Remove o membro do banco de dados
                    await controller.removerMembro(nome: member);

                    // Exibe o SnackBar com a opção de desfazer a ação
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Membro removido'),
                        action: SnackBarAction(
                          label: 'Desfazer',
                          onPressed: () async {
                            // Insere o membro de volta ao banco de dados
                            await controller.inserirMembro(nome: member);
                          },
                        ),
                      ),
                    );
                  },
                  confirmDismiss: (direction) async {
                    // Exibe o diálogo de confirmação ao deslizar para apagar
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Remover Membro'),
                          content: Text('Deseja remover o membro "$member"?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false); // Cancela a ação de remoção
                              },
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true); // Confirma a remoção
                              },
                              child: Text('Remover'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: ListTile(
                    title: Text(
                      member,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            String novoNome = ''; // Variável para armazenar o novo nome

                            return AlertDialog(
                              title: Text('Editar Membro'),
                              content: TextFormField(
                                onChanged: (value) {
                                  novoNome = value; // Atualiza o novo nome conforme o usuário digita
                                },
                                decoration: InputDecoration(labelText: 'Novo Nome'),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Fecha o diálogo
                                  },
                                  child: Text('Cancelar'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Fecha o diálogo
                                    controller.editarMembro(index: index, novoNome: novoNome); // Chama a função para editar o membro
                                  },
                                  child: Text('Confirmar'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    onTap: () {
                      // Ação ao clicar no membro
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
