import 'dart:ui';

import 'package:endiama_app/app/models/loja.dart';
import 'package:endiama_app/app/shared/style/style.dart';
import 'package:flutter/material.dart';

class SlideProduct extends StatefulWidget {
   Loja? loja;
   SlideProduct({Key? key, required this.loja}) : super(key: key);

   @override
  _SlideProductState createState() => _SlideProductState();

}

class _SlideProductState extends State<SlideProduct> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size _DeviceSize =  MediaQuery.of(context).size;
    return Container(
       width: 400,
       height:200,
       color: BOTAO.withOpacity(0.8),
       child: widget.loja!.uuid.isNotEmpty ?  Column(
         children: [
             Container(
              child:Container(
                margin: const EdgeInsets.only(left:10, top: 10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height:80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child:Image.asset(widget.loja!.urlImage,fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(widget.loja!.nome, style: TextStyle().copyWith(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height:5,),
                            Text(widget.loja!.descricao, style: TextStyle().copyWith(
                              fontSize: 11,
                              color: Colors.white,
                            ),)
                          ],
                        ),
                      ),

                    ],
                  ),
              ),
           ) ,
             SizedBox(height:4,),
             Container(
                 height:80,
                 child: ListView.builder(
                     itemCount: widget.loja!.lista.length,
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (_, posicao){

                        var _ListaProductos =  widget.loja!.lista;

                        return Card(
                           elevation: 10,
                           child: Container(
                              width:180,
                              height:120,

                              child:Column(
                                children: [
                                  Container(
                                    margin: const  EdgeInsets.only(
                                        left: 5,
                                        top: 5
                                    ),
                                    child:    Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 40,
                                            height:40,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
                                              child:Image.asset(_ListaProductos[posicao].imageUrl,fit: BoxFit.cover),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Wrap(
                                                  children: [Text(_ListaProductos[posicao].nome, style: TextStyle().copyWith(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold
                                                  ),),],
                                                ),
                                                SizedBox(height:5,),
                                                Text(_ListaProductos[posicao].descricao, style: TextStyle().copyWith(
                                                  fontSize: 6,
                                                  color: Colors.black,
                                                ),)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ) ,
                                  ),
                                  SizedBox(height:5,),
                                  Container(
                                    width:_DeviceSize.width,
                                    height: 20,
                                    color: BOTAO,
                                    child: Center(
                                       child: Text("${_ListaProductos[posicao].preco.toString()} Kz" , style: TextStyle().copyWith(
                                         color: Colors.white,
                                       ),),
                                    ),
                                  )
                                ],
                              ),
                          ),
                        );

                     },
                 ),
             )
         ],
       ): const SizedBox.shrink(),
    );
  }
}
