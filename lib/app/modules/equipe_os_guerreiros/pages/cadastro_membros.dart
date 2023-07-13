import 'package:flutter/material.dart';
import '../controller/os_guerreiros_controller.dart';

class CadastroMembrosOsGuerreiros extends StatefulWidget {
  const CadastroMembrosOsGuerreiros({Key? key}) : super(key: key);

  @override
  _CadastroMembrosOsGuerreirosState createState() => _CadastroMembrosOsGuerreirosState();
}

class _CadastroMembrosOsGuerreirosState extends State<CadastroMembrosOsGuerreiros> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final controller = OsGuerreirosController();

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: themeData.secondaryHeaderColor,
        title: const Text('Cadastro de Membros - Os guerreiros',style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 50,
                  width: largura - 100,
                  child: ElevatedButton(
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
        ),
      ),
    );
  }
}
