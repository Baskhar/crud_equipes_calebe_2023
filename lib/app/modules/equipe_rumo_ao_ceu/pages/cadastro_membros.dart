import 'package:calebe2023/app/modules/equipe_rumo_ao_ceu/controller/rumo_ao_ceu_controller.dart';
import 'package:flutter/material.dart';

class CadastroMembrosRumoAoCeu extends StatefulWidget {
  const CadastroMembrosRumoAoCeu({Key? key}) : super(key: key);

  @override
  _CadastroMembrosRumoAoCeuState createState() => _CadastroMembrosRumoAoCeuState();
}

class _CadastroMembrosRumoAoCeuState extends State<CadastroMembrosRumoAoCeu> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final controller = RumoAoCeuController();

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
