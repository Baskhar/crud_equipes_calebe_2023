
import 'package:calebe2023/app/modules/equipe_os_guerreiros/os_gurerriros_home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';


import '../controller/os_guerreiros_controller.dart';
import '../pages/cadastro_membros.dart';
import '../pages/lista_membros_os_guerreiros.dart';
import '../pages/pontuacao_page.dart';
import '../pages/registro_pontuacao_page.dart';


class OsGuerreirosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => OsGuerreirosController()),
  ];

  @override
  final List<ModularRoute> routes = [


    ChildRoute('/', child: (_, __) => OsGuerreirosHomePage(),transition: TransitionType.rightToLeft),
    ChildRoute('/lista_membros', child: (_, __) => ListaMembrosOsGuerreiros(),transition: TransitionType.downToUp),
    ChildRoute('/pontuacao', child: (_, __) => PontuacaoPage(),transition: TransitionType.rotate),
    ChildRoute('/registro_pontuacao', child: (_, __) => RegistroPontuacaoPage(),transition: TransitionType.fadeIn),
    ChildRoute('/cadastro_membro', child: (_, __) => CadastroMembrosOsGuerreiros(),transition: TransitionType.rightToLeftWithFade),
  ];
}
