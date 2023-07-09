import 'package:flutter/material.dart';
import '../controller/equipe1_controller.dart';

class CadastroMembrosEquipe1 extends StatefulWidget {
  const CadastroMembrosEquipe1({Key? key}) : super(key: key);

  @override
  _CadastroMembrosEquipe1State createState() => _CadastroMembrosEquipe1State();
}

class _CadastroMembrosEquipe1State extends State<CadastroMembrosEquipe1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final controller = Equipe1Controller();

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Membros - Equipe 1'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nomeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final nome = _nomeController.text;

                      // Chamar o método de inserirNome
                      controller.inserirMembro(nome: nome);

                      // Limpar o campo
                      _nomeController.clear();
                    }
                  },
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
