import 'dart:ui';

import 'package:endiama_app/app/home/model/notificao.dart';
import 'package:endiama_app/app/shared/assets/file_path.dart';
import 'package:flutter/material.dart';


class NotificacaoPage extends StatefulWidget {
      @override
     _NotificacaoPageState createState() => _NotificacaoPageState();
}

class _NotificacaoPageState extends State<NotificacaoPage> {
  @override
  Widget build(BuildContext context) {
    Size Device   =  MediaQuery.of(context).size;
    return Container(
       margin: const  EdgeInsets.only(
         left:5,
         right: 5
       ),
       height:Device.height,
       child: ListView.builder(
           itemCount: listaNotificacoes.length,
           itemBuilder: (_ ,posicao) {
              return Card(
                elevation: 7,
                child:  Container(
                  height: 80,
                  padding: const EdgeInsets.only(left:5),
                  child:  Column(
                      children: [
                         Row(
                           children: [
                               Image.asset(
                                 notificacaoPath,
                                 fit: BoxFit.cover,
                                 width: 70,
                                 height: 70,
                                ),

                                Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(
                                     left:5
                                   ),
                                   child:  Text(listaNotificacoes[posicao].titulo , style: TextStyle().copyWith(
                                     color: Colors.black,
                                     fontWeight: FontWeight.bold ,
                                   ), textAlign: TextAlign.justify,)
                                 ),
                                 Padding(
                                     padding: const  EdgeInsets.only(
                                         left:5 ,
                                         top: 5
                                     ),
                                     child:    Text(listaNotificacoes[posicao].descricao, style: TextStyle().copyWith(
                                         fontSize: 8,
                                         color: Colors.black
                                     ),  textAlign: TextAlign.justify,)
                                 ) ,

                                 Padding(
                                   padding: const EdgeInsets.only(
                                     top: 5,
                                     left: 5
                                   ),
                                   child: Text("Abril 11, 2022" , style: TextStyle().copyWith(
                                      color:  Colors.black54,
                                      fontWeight: FontWeight.bold ,
                                      fontSize: 7
                                   ),),
                                 )
                               ],
                             )

                           ],
                         ),

                      ],
                  ),
                ),

              );
           }
       ),

    );
  }
}
