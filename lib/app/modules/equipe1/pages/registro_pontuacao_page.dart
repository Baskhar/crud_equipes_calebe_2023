import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:intl/intl.dart';

import '../controller/equipe1_controller.dart';

class RegistroPontuacaoPage extends StatefulWidget {
  const RegistroPontuacaoPage({Key? key}) : super(key: key);

  @override
  _RegistroPontuacaoPageState createState() => _RegistroPontuacaoPageState();
}

class _RegistroPontuacaoPageState extends State<RegistroPontuacaoPage> {
  final controller = Equipe1Controller();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pontuacaoController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _detalhesController = TextEditingController();

  @override
  void dispose() {
    atualiza();
    //controller.consultaPontuacao();
    _pontuacaoController.dispose();
    _dataController.dispose();
    _detalhesController.dispose();

    super.dispose();
  }

  Future<void> atualiza()async{
   await  controller.consultaPontuacao();
  }
  void _showDateTimePicker() {
    showDialog(
      context: context,
      builder: (context) {
        DateTime? selectedDate;

        return AlertDialog(
          title: const Text('Selecione a data'),
          content: DateTimeField(
            format: DateFormat('yyyy-MM-dd HH:mm'),
            onShowPicker: (context, currentValue) async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100),
              );

              if (date != null) {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );

                if (time != null) {
                  selectedDate = DateTimeField.combine(date, time);
                  return selectedDate;
                }
              }

              return currentValue;
            },
            validator: (value) {
              if (value == null) {
                return 'Campo obrigatório';
              }
              return null;
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedDate != null) {
                  setState(() {
                    _dataController.text = DateFormat('yyyy-MM-dd HH:mm').format(selectedDate!);
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Selecionar'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Pontuação'),
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
                  controller: _pontuacaoController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    final pontuacao = int.tryParse(value);
                    if (pontuacao == null) {
                      return 'Informe um número inteiro';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Pontuação',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _dataController,
                  readOnly: true,
                  onTap: _showDateTimePicker,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Data',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _detalhesController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Detalhes',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: ()async {
                    if (_formKey.currentState!.validate()) {
                      final pontuacao = int.parse(_pontuacaoController.text);
                      final data = _dataController.text;
                      final detalhes = _detalhesController.text;

                      // Chamar as funções de inserirPontuacao e registroPontuacao
                      controller.inserirPontuacao(pontuacao: pontuacao);
                      controller.registroPontuacao(data: data, detalhes: detalhes, ponto: pontuacao);

                      // Limpar os campos
                      _pontuacaoController.clear();
                      _dataController.clear();
                      _detalhesController.clear();
                      //Modular.to.popUntil(ModalRoute.withName('/equipe1'));
                      // await  controller.consultaPontuacao();
                      // if (pontuacao != null) {
                      //   // Retornar a pontuação para a página anterior
                      //   controller.atualizarPontuacaoGlobal(pontuacao);
                      //   Modular.to.pop();
                      // }
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
