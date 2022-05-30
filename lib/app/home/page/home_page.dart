import 'dart:async';
import 'package:endiama_app/app/helper/empty_shop.dart';
import 'package:endiama_app/app/home/bloc/map/map_bloc.dart';
import 'package:endiama_app/app/home/bloc/map/map_event.dart';
import 'package:endiama_app/app/home/bloc/map/map_state.dart';
import 'package:endiama_app/app/home/page/map_page.dart';
import 'package:endiama_app/app/home/page/notificacao_page.dart';
import 'package:endiama_app/app/home/widgets/drawer_user_profile.dart';
import 'package:endiama_app/app/shared/assets/file_path.dart';
import 'package:endiama_app/app/shared/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class
HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>   with SingleTickerProviderStateMixin {

  late final TabController  _tabController     =  TabController( length: 3, vsync: this,initialIndex: 0 );
  late final TextEditingController _pesquisa =    TextEditingController();
  final StreamController<int> _tabPositionStream =  StreamController.broadcast();

  final  int  TABHOME = 0;
  final int  TABFAVORITOS =  1;
  final int  TABNOTIFICACAO  = 2;
  final   GlobalKey<ScaffoldState> _openDrawerUser =  GlobalKey<ScaffoldState>();



  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _tabPositionStream.close();
  }

  @override
  Widget build(BuildContext context) {
    Size DeciveSize  = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: DrawerUserProfile(),
      resizeToAvoidBottomInset: false,
      body: Builder(
           key: _openDrawerUser ,
           builder: (BuildContext context){
             return SafeArea(child:
               Container(
               child: SingleChildScrollView(
                 physics: NeverScrollableScrollPhysics(),
                 child:  Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Container(
                       margin: const EdgeInsets.only(left: 10, top: 5),
                       child:  Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Manuel Correia \n Muenho", style: TextStyle().copyWith(
                               fontWeight: FontWeight.bold ,
                               fontSize: 16,
                               color:Colors.black
                           ),textAlign: TextAlign.justify,),
                           InkWell(
                             onTap: () { Scaffold.of(context).openEndDrawer();},
                             child:Container(
                               margin: EdgeInsets.only(
                                   right:10
                               ),
                               child:  ClipRRect(
                                 borderRadius: BorderRadius.circular(8.0),
                                 child:Image.asset(PerfilUser,fit: BoxFit.cover),
                               ),
                             ),
                           )
                         ],
                       ),
                       height:60,
                     ),
                     StreamBuilder<int>(
                         stream: _tabPositionStream.stream,
                         initialData: 0,
                         builder:(context , index)  {
                            if(index.data == TABHOME){
                              return Container(
                                child: BlocProvider(
                                  create: (context)=>   BlocProvider.of<MapBloc>(context),
                                  child:  BlocBuilder <MapBloc,  MapState>(
                                    bloc: BlocProvider.of<MapBloc>(context),
                                    builder: (context, state) {
                                      return Stack(
                                        fit: StackFit.loose,
                                        children: [
                                          TextFormField(
                                            controller: _pesquisa,
                                            decoration:const   InputDecoration(
                                                hintText: "Pesquisa por um produto" ,
                                                hintStyle:  TextStyle(
                                                    fontSize: 13
                                                ) ,
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                                                ),
                                                enabledBorder:OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                                                )
                                            ),
                                          ) ,
                                          Positioned(
                                            child:MaterialButton(
                                              onPressed: (){

                                                if (_pesquisa.value.text.isEmpty) {
                                                  // colocando o valor default da aplicacao
                                                  BlocProvider.of<MapBloc>(context)
                                                      .add(MapEventIsLoading(
                                                      uuidUser: "AGHAHDDV132BBDDSD" ,
                                                      productStream:  searchFormStreamController.productFoundStream
                                                  ));

                                                } else {
                                                    //  Fazendo a Search dos shops
                                                    BlocProvider.of<MapBloc>(context)
                                                    .add(MapEventCleanSeachItems(
                                                        productStream: searchFormStreamController.productFoundStream ,
                                                        pesquisa: _pesquisa.text
                                                    ));

                                                }
                                              },
                                              minWidth: 40,
                                              child:const  Icon(Icons.search , color:Colors.white,),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              color:BOTAO,
                                            ),
                                            left: 280,
                                            top: -6,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ) ,
                              );
                            }
                            return SizedBox.shrink();
                         }),
                     Container(
                       height: DeciveSize.height/1.36,
                       child: SafeArea(
                           child:  TabBarView(
                               physics: NeverScrollableScrollPhysics(),
                               controller: _tabController,
                               children:  [
                                 Container(
                                     child: Center(child: MapPage()),
                                 ),
                                 Container(
                                   child:const  Center(
                                     child: Text("FAVORITOS"),
                                   ),
                                 ),
                                 Container(
                                   child:Center(
                                     child: NotificacaoPage() ,
                                   ),
                                 ),
                               ]
                           )),
                     )
                   ],
                 ),
               ),
             ));
          },
      ),
      bottomNavigationBar: Container(
        child: StreamBuilder<int>(
            stream: _tabPositionStream.stream,
            initialData: 0,
            builder: (_ ,index){
               return TabBar(
                   controller: _tabController,
                   indicatorColor: BOTAO,
                   onTap: (int page) {
                       _tabPositionStream.sink.add(page);
                   },
                   tabs: [
                      Tab(icon: Icon(Icons.home, color: index.data == TABHOME ? BOTAO:SUBTITULO,)),
                      Tab(icon: Icon(Icons.star_border_purple500_sharp , color: index.data ==TABFAVORITOS ?BOTAO:SUBTITULO)),
                      Tab(icon: Icon(Icons.notifications_none_outlined ,color:  index.data == TABNOTIFICACAO?BOTAO:SUBTITULO))
                   ]
               );
            }
        ),
      ),
    );
  }
}
