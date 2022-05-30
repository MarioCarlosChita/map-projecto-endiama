import 'dart:async';

import 'package:endiama_app/app/helper/empty_shop.dart';
import 'package:endiama_app/app/home/bloc/map/map_event.dart';
import 'package:endiama_app/app/home/bloc/map/map_state.dart';
import 'package:endiama_app/app/models/loja.dart';
import 'package:endiama_app/app/models/produto.dart';
import 'package:endiama_app/app/shared/assets/file_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapBloc extends Bloc<MapEvent , MapState>{


  late GoogleMapController _googleMapController;
  LatLng _center =  const LatLng(-8.8976318, 13.1855707);
  final Location _userLocation = Location();
  bool?  _serviceEnabled ;
  PermissionStatus?  _permissionStatus;

  Set<Marker> markers = {};

  Set<Marker> _searchProductShowMarkets  = {};



  @override
  Stream<MapState> mapEventToState(MapEvent event) async* {
         _setUserLocation();

      if (event is MapEventIsLoading) {
            _setShopsMarketsPlace(stream: event.productStream);
            _setUsersMarkets(uuidUser:event.uuidUser);
            yield  MapStateMapIsLoaded(
                 google: GoogleMap(
                 mapType: MapType.normal,
                 minMaxZoomPreference: const MinMaxZoomPreference(15, 25),
                 onMapCreated: _onMapController,
                 zoomControlsEnabled: true,
                 mapToolbarEnabled: true,
                 markers:markers,
                 myLocationButtonEnabled: true,
                 myLocationEnabled: true,
                 onTap: (LatLng location) {
                     event.productStream.sink.add(EmptyShop.resetShop);
                 },
                 initialCameraPosition: CameraPosition(target:_center)
               )
           );
      }


      if (event is  MapEventCleanSeachItems){

        _seachProductShowMarkets(search: event.pesquisa , stream: event.productStream);

        yield  MapStateMapIsLoaded(
            google: GoogleMap(
                mapType: MapType.normal,
                minMaxZoomPreference: const MinMaxZoomPreference(15, 25),
                onMapCreated: _onMapController,
                zoomControlsEnabled: true,
                mapToolbarEnabled: true,
                markers: _searchProductShowMarkets ,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                onTap: (LatLng location) {
                  event.productStream.sink.add(EmptyShop.resetShop);
                },
                initialCameraPosition: CameraPosition(target:_center)
            )
        );
      }

  }

  Future<Location> _hasPermissao()   async{
     await  _userLocation.changeSettings(accuracy: LocationAccuracy.HIGH, interval: 1000);
     _serviceEnabled =  await _userLocation.serviceEnabled();
     bool  _status  =  _serviceEnabled ??  false;

     if (!_status) {
        _serviceEnabled =  await _userLocation.requestService();
     }

     _permissionStatus = await _userLocation.hasPermission();
     if(_permissionStatus == PermissionStatus.DENIED) {
       _permissionStatus =  await  _userLocation.requestPermission();
     }

     return  _userLocation ;
  }

  void _onMapController(GoogleMapController  controller) {
       _googleMapController = controller;
  }

  void _setUserLocation()  async {
    try {
      final  _requestPermission  =  await  _hasPermissao();
      LocationData  _locationData  = await  _requestPermission.getLocation();
      _center =  LatLng(_locationData.latitude  , _locationData.longitude);

      }  on PlatformException catch (e) {
         print(e);
      if (e.code == 'PERMISSION_DENIED') {
          print("Error e Permissao");
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
          print("Erro de Servico");
      }
     }
  }


  void  _setUsersMarkets ({required  String uuidUser}) {
      Marker _userMarkerPlace   = Marker(
         markerId: MarkerId(uuidUser),
         position: _center,
         infoWindow: const InfoWindow( title:  'Manuel Corriea Muenho', snippet:'manuel.muenho@endiama.co.ao',),
         icon: BitmapDescriptor.defaultMarker
      );
       markers.add(_userMarkerPlace);
  }

  void _setShopsMarketsPlace({required StreamController stream}) async {
     markers.clear();
     List<Loja> _listaShops = listaShops;
     for (int index  = 0 ; index  <_listaShops.length  ; ++index){
       Marker _userMarkerPlace   = Marker(
         markerId: MarkerId(_listaShops[index].uuid),
         position: _listaShops[index].latLng,
         onTap: () => stream.sink.add(_listaShops[index]),
         icon: await  _setIconMarkPlace() ,
       );
        markers.add(_userMarkerPlace);
     }
  }

  dynamic _setIconMarkPlace() async {
     return await BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 1.5), ShopPath);
  }

  void _seachProductShowMarkets({required String search ,required StreamController stream})  async {

       // cleanning the map to set news values
       _searchProductShowMarkets = {};
       Marker _userMarkerPlace   = Marker(
           markerId: MarkerId("AGHAHDDV132BBDDSD"),
           position: _center,
           infoWindow: const InfoWindow( title:  'Manuel Corriea Muenho', snippet:'manuel.muenho@endiama.co.ao',),
           icon: BitmapDescriptor.defaultMarker
       );
       _searchProductShowMarkets.add(_userMarkerPlace);

       List<Loja> _listaShops = listaShops;
       Map<String ,Loja> _shopsFounds = {};

       for (int  index  =  0 ;  index < _listaShops.length  ;  ++index){
             List<Producto> productFound = _listaShops[index].lista;
             for(int itemIndex = 0  ; itemIndex <productFound.length ; ++itemIndex) {
                   // get each product and ask if it is the right value
                   Producto  _producto  =  productFound[itemIndex];

                   if(_producto.nome.trim().toLowerCase().contains(search.trim().toLowerCase())) {
                      if(!_shopsFounds.containsKey(listaShops[index].uuid)){
                           // inserting the found  item do the  final map
                           _shopsFounds[listaShops[index].uuid] = listaShops[index];
                      }
                   }
            }
       }

       // finding the right ponto to the camera
       LatLng? _ponto ;

       _shopsFounds.forEach((key, value)  async{
          _ponto ??= LatLng(value.latLng.latitude, value.latLng.longitude);
         Marker _userMarkerPlace   = Marker(
           markerId: MarkerId(value.uuid),
           position: value.latLng,
           onTap: () =>stream.sink.add(value),
           icon: await  _setIconMarkPlace() ,
         );
         _searchProductShowMarkets.add(_userMarkerPlace);
       }) ;

       // carryng the user the right camera position
       if(_ponto  != null) {
         _googleMapController
           .animateCamera(CameraUpdate.newLatLngZoom(LatLng(_ponto!.latitude, _ponto!.longitude), 14));
       }
  }

  get initialState => MapStateIsLoading();

}