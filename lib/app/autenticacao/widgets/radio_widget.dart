

import 'package:endiama_app/app/shared/style/style.dart';
import 'package:flutter/material.dart';

class RadioPoint{
    int page ;
    RadioPoint({required this.page});

    Widget RadioWidget({ required int  pageIndex}){
      return Container(
          margin: EdgeInsets.only(
             left: 3,
             right:3
          ),
          height: 5,
          width: 5,
          decoration: BoxDecoration(
              color: pageIndex != this.page ? SUBTITULO: BOTAO,
              borderRadius: BorderRadius.circular(50)
          )
      );
    }

}



