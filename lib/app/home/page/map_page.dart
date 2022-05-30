// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:endiama_app/app/helper/empty_shop.dart';
import 'package:endiama_app/app/home/bloc/map/map_bloc.dart';
import 'package:endiama_app/app/home/bloc/map/map_event.dart';
import 'package:endiama_app/app/home/bloc/map/map_state.dart';
import 'package:endiama_app/app/home/page/slide_product.dart';
import 'package:endiama_app/app/models/loja.dart';
import 'package:endiama_app/app/shared/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapPage extends StatefulWidget {
  static  StreamController<Loja> productStream  = new StreamController.broadcast();
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  TextEditingController _pesquisa =  TextEditingController();
  double _TopAnimationSearch = 0;
  final  int  TABHOME = 0;

  @override
  void initState() {
     this._loadDataMapBloc();
     super.initState();
  }

  void _loadDataMapBloc() {
     BlocProvider.of<MapBloc>(context)..add(MapEventIsLoading(uuidUser: "AGHAHDDV132BBDDSD" , productStream:  searchFormStreamController.productFoundStream ));
  }

  void dispose() {
   MapPage.productStream.close();
   super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size Device =MediaQuery.of(context).size;
    return BlocProvider(
        create: (context)=>   BlocProvider.of<MapBloc>(context),
        child:  BlocBuilder <MapBloc,  MapState>(
          bloc: BlocProvider.of<MapBloc>(context),
          builder: (_ ,state) {
            if( state is  MapStateMapIsLoaded ){
              return Stack(
                fit: StackFit.passthrough,
                children: [
                  state.google,
                  StreamBuilder<Loja>(
                      stream:searchFormStreamController.productFoundStream.stream,
                      initialData: EmptyShop.resetShop,
                      builder: (_, state){

                        Loja? _uuidShop = state.data;
                        bool _state =  (_uuidShop!.uuid).isEmpty;

                        if(_state) {
                          return  SizedBox.shrink();
                        }

                        Loja ? _selectedLoja = state.data;
                        return  Align(alignment: Alignment.bottomCenter, child: SlideProduct( loja: _selectedLoja));

                      }
                  ),
                ],
              );
            } else {
              return  const  CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(BOTAO));
            }
          },
        ),
    );
  }

}

