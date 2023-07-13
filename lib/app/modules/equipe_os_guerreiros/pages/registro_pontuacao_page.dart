import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../controller/os_guerreiros_controller.dart';

class RegistroPontuacaoPage extends StatefulWidget {
  const RegistroPontuacaoPage({Key? key}) : super(key: key);

  @override
  _RegistroPontuacaoPageState createState() => _RegistroPontuacaoPageState();
}

class _RegistroPontuacaoPageState extends State<RegistroPontuacaoPage> {
  final controller = OsGuerreirosController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pontuacaoController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _detalhesController = TextEditingController();

  @override
  void dispose() {
    atualiza();
    _pontuacaoController.dispose();
    _dataController.dispose();
    _detalhesController.dispose();

    super.dispose();
  }

  Future<void> atualiza() async {
    await controller.consultaPontuacao();
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF068b9c),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF068b9c),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final largura = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: themeData.secondaryHeaderColor,
        title: const Text(
          'Registro de Pontuação',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    decoration: InputDecoration(
                      labelText: 'Pontuação',
                      border: OutlineInputBorder(),
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
                    decoration: InputDecoration(
                      labelText: 'Data',
                      border: OutlineInputBorder(),
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
                    decoration: InputDecoration(
                      labelText: 'Detalhes',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    width: largura -100,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final pontuacao = int.parse(_pontuacaoController.text);
                          final data = _dataController.text;
                          final detalhes = _detalhesController.text;

                          controller.inserirPontuacao(pontuacao: pontuacao);
                          controller.registroPontuacao(data: data, detalhes: detalhes, ponto: pontuacao);

                          _pontuacaoController.clear();
                          _dataController.clear();
                          _detalhesController.clear();
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
      ),
    );
  }
}
