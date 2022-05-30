import 'package:endiama_app/app/app_boot.dart';
import 'package:endiama_app/app/autenticacao/autenticacao_module.dart';
import 'package:endiama_app/app/home/bloc/map/map_bloc.dart';
import 'package:endiama_app/app/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BootstrapModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
       ChildRoute('/', child:(context , args)=> AppBootPage()) ,
       ModuleRoute('/autenticacao/', module: AutenticacaoModule()) ,
  ];
}


class AppWidget extends  StatelessWidget{
    @override
    Widget build(BuildContext context) {
      return MultiBlocProvider(
          providers: [
                BlocProvider<MapBloc>(create: (_)=> MapBloc(),)
          ],
          child: MaterialApp.router(
            theme: ThemeData(primarySwatch: Colors.blue),
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
            debugShowCheckedModeBanner:false,
          ));
  }
}