
import 'dart:async';

import 'package:endiama_app/app/models/loja.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EmptyShop {
     static  Loja resetShop = Loja(
         uuid: "",
         nome: "",
         latLng: const LatLng(0.0,0.0),
         lista: [],
         urlImage: "",
         descricao: ""
     );
}


class  searchFormStreamController{
      static StreamController<Loja> productFoundStream =  StreamController.broadcast();
}

class  searchFormPosition{
      static StreamController<int> productFoundStream =  StreamController.broadcast();
}