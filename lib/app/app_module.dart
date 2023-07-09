import 'package:calebe2023/app/services/cloudfirestore/firebasemodule.dart';
import 'package:flutter_modular/flutter_modular.dart';


import 'modules/equipe1/module/equipe1_module.dart';
import 'modules/equipe_rumo_ao_ceu/module/rumo_ao_ceu_module.dart';

import 'modules/home_module/home_page.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    //FirebaseModule(),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => HomePage()),
    ModuleRoute('/equipe1', module: Equipe1Module()),
    ModuleRoute('/rumo_ao_ceu', module: RumoAoCeuModule()),
    // ChildRoute('/equipe1_page',
    //     child: (context, args) => Equipe1HomePage(),
    //     transition: TransitionType.size),
  ];
}
