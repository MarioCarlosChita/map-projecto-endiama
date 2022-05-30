import 'package:endiama_app/app/autenticacao/pages/autenticacao.dart';
import 'package:endiama_app/app/bloc/app_boot_bloc.dart';
import 'package:endiama_app/app/bloc/app_boot_event.dart';
import 'package:endiama_app/app/bloc/app_boot_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBootPage extends StatefulWidget {
  @override
  _AppBootPageState createState() => _AppBootPageState();
}

class _AppBootPageState extends State<AppBootPage> {
  
  @override
  Widget build(BuildContext context) {
       return Scaffold(
            body: BlocListener<AppBootBloc , AppBootState>(
              bloc:AppBootBloc()..add(AppBootStateIsLoggedEvent()),
              child:Container(),
              listener: (context ,state){
                if(state is AppBootStateIsLoggedState){
                  _IsAutenticatedUser();
                }
                if(state  is AppBootStateIsNotLoggedState) {
                  _IsNotAutenticatedUser();
                }
              },
            )
       );
  }


  void _IsNotAutenticatedUser() {
       Modular.to.navigate('/autenticacao');
  }
  void _IsAutenticatedUser() {
       Modular.to.navigate('/home');
  }
}
