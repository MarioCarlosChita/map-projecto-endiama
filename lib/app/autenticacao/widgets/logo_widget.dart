

 import 'package:endiama_app/app/shared/assets/file_path.dart';
import 'package:endiama_app/app/shared/style/style.dart';
import 'package:flutter/material.dart';

Widget  LogoCard  ()  {
   return Column(
     crossAxisAlignment: CrossAxisAlignment.center,
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Image.asset(LogoPath, width: 200, height:45, fit: BoxFit.fill),
       SizedBox(height:10,),
       Text("Empresa Nacional de Diamantes em Angola EP",style: TextStyle().copyWith(
           fontSize: 11,
           color: SUBTITULO
       ),),
      ],
   );
 }