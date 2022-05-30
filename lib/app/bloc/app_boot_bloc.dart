import 'package:endiama_app/app/bloc/app_boot_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_boot_state.dart';

class AppBootBloc extends Bloc<AppBootEvent ,AppBootState> {

  Stream<AppBootState>  mapEventToState(AppBootEvent event) async*{
      if(event is AppBootStateIsLoggedEvent){
            yield AppBootStateIsNotLoggedState();
      }
  }

  @override
  // TODO: implement initialState
   AppBootState get initialState => AppBootStateIsLoadingState();
}