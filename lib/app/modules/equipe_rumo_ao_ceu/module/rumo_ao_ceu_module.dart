
import 'package:calebe2023/app/modules/equipe_rumo_ao_ceu/controller/rumo_ao_ceu_controller.dart';
import 'package:calebe2023/app/modules/equipe_rumo_ao_ceu/pages/cadastro_membros.dart';
import 'package:calebe2023/app/modules/equipe_rumo_ao_ceu/pages/lista_membros_rumo.dart';
import 'package:calebe2023/app/modules/equipe_rumo_ao_ceu/pages/pontuacao_page.dart';
import 'package:calebe2023/app/modules/equipe_rumo_ao_ceu/pages/registro_pontuacao_page.dart';
import 'package:calebe2023/app/modules/equipe_rumo_ao_ceu/rumo_ao_ceu_home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';


import '../../../services/cloudfirestore/firebasemodule.dart';



class RumoAoCeuModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => RumoAoCeuController()),
  ];

  @override
  final List<ModularRoute> routes = [


    ChildRoute('/', child: (_, __) => RumoAoCeuHomePage()),
    ChildRoute('/lista_membros', child: (_, __) => ListaMembrosRumoAoCeu()),
    ChildRoute('/pontuacao', child: (_, __) => PontuacaoPageRumoAoCeu()),
    ChildRoute('/registro_pontuacao', child: (_, __) => RegistroPontuacaoPageRumoAoCeu()),
    ChildRoute('/cadastro_membro', child: (_, __) => CadastroMembrosRumoAoCeu()),
  ];
}
