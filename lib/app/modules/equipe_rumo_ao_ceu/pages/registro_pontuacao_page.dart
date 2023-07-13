import 'package:calebe2023/app/modules/equipe_rumo_ao_ceu/controller/rumo_ao_ceu_controller.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';



import 'package:intl/intl.dart';



class RegistroPontuacaoPageRumoAoCeu extends StatefulWidget {
  const RegistroPontuacaoPageRumoAoCeu({Key? key}) : super(key: key);

  @override
  _RegistroPontuacaoPageRumoAoCeuState createState() => _RegistroPontuacaoPageRumoAoCeuState();
}

class _RegistroPontuacaoPageRumoAoCeuState extends State<RegistroPontuacaoPageRumoAoCeu> {
  final controller = RumoAoCeuController();
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
            format: DateFormat('dd/MM/yyyy HH:mm', 'pt_BR'),
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
                    _dataController.text = DateFormat('dd/MM/yyyy HH:mm', 'pt_BR').format(selectedDate!);



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
        title: const Text('Registro de Pontuação'),
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
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
                    labelText: 'Detalhes',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: largura -100,
                  child: ElevatedButton(
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
