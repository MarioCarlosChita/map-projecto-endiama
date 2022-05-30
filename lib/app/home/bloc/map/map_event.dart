import 'dart:async';

import 'package:endiama_app/app/models/loja.dart';

class MapEvent {}

class MapEventIsLoading extends  MapEvent {
     String  uuidUser;
     StreamController<Loja> productStream;
     MapEventIsLoading({required  this.uuidUser  ,required this.productStream});
}

class MapEventCleanSeachItems extends MapEvent {
  String  pesquisa;
  StreamController<Loja> productStream;
  MapEventCleanSeachItems({required  this.productStream , required this.pesquisa});
}

class MapEventSearchItems extends  MapEvent{
   String searchParams ;
   MapEventSearchItems({required  this.searchParams});
}




