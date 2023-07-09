import 'package:calebe2023/app/modules/equipe1/equipe1_home_page.dart';
import 'package:calebe2023/app/modules/equipe1/pages/cadastro_membros.dart';
import 'package:flutter_modular/flutter_modular.dart';


import '../../../services/cloudfirestore/firebasemodule.dart';
import '../controller/equipe1_controller.dart';
import '../pages/lista_membros_equipe1.dart';
import '../pages/pontuacao_page.dart';
import '../pages/registro_pontuacao_page.dart';


class Equipe1Module extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Equipe1Controller()),
  ];

  @override
  final List<ModularRoute> routes = [


    ChildRoute('/', child: (_, __) => Equipe1HomePage()),
    ChildRoute('/lista_membros', child: (_, __) => ListaMembrosEquipe1()),
    ChildRoute('/pontuacao', child: (_, __) => PontuacaoPage()),
    ChildRoute('/registro_pontuacao', child: (_, __) => RegistroPontuacaoPage()),
    ChildRoute('/cadastro_membro', child: (_, __) => CadastroMembrosEquipe1()),
  ];
}
