
import 'package:endiama_app/app/autenticacao/widgets/model/card.dart';
import 'package:flutter/material.dart';

Widget CardIntroductionWidget({required  CardIntroduction  cardIntroduction}){
  return Container(
     child: Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text(cardIntroduction.titulo, style: TextStyle().copyWith(
                  fontSize:16 ,
                  fontWeight: FontWeight.bold,

              ), textAlign: TextAlign.center,) ,
              SizedBox(height: 60,),
              Image.asset(cardIntroduction.pathImage, fit: BoxFit.cover,)
          ],
     ),
  );
}