

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {}

class MapStateIsLoading extends  MapState {}


class MapStateMapIsLoaded extends MapState{
  GoogleMap google;
  MapStateMapIsLoaded({required  this.google});
}

class MapStateCleanSeachItems extends MapState  {
      GoogleMap google;
      MapStateCleanSeachItems({required  this.google});
}

class MapStateSearchItems extends  MapState{
      GoogleMap google;
      MapStateSearchItems({required  this.google});
}

