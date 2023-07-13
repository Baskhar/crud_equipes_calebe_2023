
import 'package:flutter_modular/flutter_modular.dart';



import 'modules/equipe_os_guerreiros/module/os_guerreiros_module.dart';
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
    ModuleRoute('/equipe1', module: OsGuerreirosModule()),
    ModuleRoute('/rumo_ao_ceu', module: RumoAoCeuModule()),
    // ChildRoute('/equipe1_page',
    //     child: (context, args) => Equipe1HomePage(),
    //     transition: TransitionType.size),
  ];
}
