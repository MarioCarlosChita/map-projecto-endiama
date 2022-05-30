import 'dart:ui';

import 'package:endiama_app/app/shared/assets/file_path.dart';
import 'package:endiama_app/app/shared/style/style.dart';
import 'package:flutter/material.dart';

class DrawerUserProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

     return Container(
       color: Colors.white,
       padding: const EdgeInsets.only(top: 90),
       child:  Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
           children: [
                Container(
                  margin: const  EdgeInsets.only(
                     left: 20,
                     top: 2
                  ),
                  child:   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child:Image.asset(PerfilUser,fit: BoxFit.cover ,width: 50, height: 50,),
                      ),
                      SizedBox(height:3,),
                      Text('manuel.muenho@endiama.co.ao' , style: TextStyle().copyWith(
                          fontSize: 11,
                          color:SUBTITULO
                      ),)
                    ],
                  ),
                ),
                Divider(),
                SizedBox(height:80,),

                ListTile(
                   title: Text("Perfil", style: TextStyle().copyWith(
                       fontSize: 22,
                       fontWeight: FontWeight.bold
                   ),),
                   subtitle: Text('dados do perfil do usuario', style: TextStyle().copyWith(
                     fontSize: 11,
                     color: SUBTITULO
                   ),),
                ) ,
                SizedBox(height:10,),
                ListTile(
                title: Text("Configurações", style: TextStyle().copyWith(
                   fontSize: 22,
                   fontWeight: FontWeight.bold
                ),),
                subtitle: Text('configurações do aplicativo', style: TextStyle().copyWith(
                   fontSize: 11,
                   color: SUBTITULO
               ),),
             ) ,
                SizedBox(height: 10,),
                ListTile(
                title: Text("Sair", style: TextStyle().copyWith(
                   fontSize: 22,
                   fontWeight: FontWeight.bold
                ),),
                subtitle: Text("sair da aplicação", style: TextStyle().copyWith(
                   fontSize: 11,
                   color: SUBTITULO
               ),),
             )
           ],
       ),
     );
  }

}