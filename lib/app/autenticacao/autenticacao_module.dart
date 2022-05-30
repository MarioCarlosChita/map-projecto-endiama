import 'package:endiama_app/app/autenticacao/pages/autenticacao.dart';
import 'package:endiama_app/app/autenticacao/pages/introduction_slide.dart';
import 'package:endiama_app/app/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AutenticacaoModule extends Module{
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
      ChildRoute('/', child:(context , args)=> AutenticacaoPage()) ,
      ChildRoute('/introduction',child: (context, args) => IntroducaoSlidePage()) ,
      ModuleRoute('/home/', module: HomeModule())
  ];
}