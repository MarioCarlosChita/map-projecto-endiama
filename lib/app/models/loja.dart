import 'package:endiama_app/app/models/produto.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Loja {
      String uuid;
      String nome;
      LatLng latLng ;
      List<Producto> lista;
      String urlImage;
      String descricao;
      Loja({
        required this.uuid,
        required this.nome,
        required this.latLng,
        required this.lista,
        required this.urlImage,
        required this.descricao,
      });
}



final List<Loja>  listaShops =[
        Loja(
            uuid: "1UIEW1",
            nome: "Império Das Joias Gamek",
            latLng: const  LatLng(-8.9104026 , 13.1790422),
            urlImage:"assets/loja_1.jpg" ,
            descricao: "",
            lista: [
              Producto(
                  imageUrl: "assets/diamante_5.jpg",
                  nome: "Correntes",
                  preco: 400000,
                  fabricante: "Angolana",
                  descricao: "Diamantes fino de ouro"
              ) ,

              Producto(
                imageUrl: "assets/diamante_1.jpg",
                nome: "Correntes de Fio",
                preco: 400000,
                fabricante: "Angolana",
                descricao: "corrente fina",

              ),

              Producto(
                  imageUrl: "assets/diamante_4.jpg",
                  nome: "Colar Fino",
                  preco: 400000,
                  fabricante: "Angolana",
                  descricao: "linhas de diamantes"
              ),

              Producto(
                  imageUrl: "assets/diamante_2.jpg",
                  nome: "Colar Escuros",
                  preco: 32000,
                  fabricante: "Angolana",
                  descricao: "especiarias de diamentes"
              )
            ]) ,
        Loja(
            uuid: "1UIEW432wwq",
            nome: "Colar Grosso",
            latLng: const  LatLng(-8.8975001 ,13.1765851),
            urlImage:"assets/loja_2.jpg" ,
            descricao:"loja angolana de joias",
            lista: [
              Producto(
                  imageUrl: "assets/diamante_5.jpg",
                  nome: "Correntes",
                  preco: 400000,
                  fabricante: "Angolana",
                  descricao: "Diamantes fino de ouro"
              ) ,

              Producto(
                imageUrl: "assets/diamante_1.jpg",
                nome: "Correntes de Fio",
                preco: 400000,
                fabricante: "Angolana",
                descricao: "corrente fina",

              ),

              Producto(
                  imageUrl: "assets/diamante_4.jpg",
                  nome: "Colar Fino",
                  preco: 400000,
                  fabricante: "Angolana",
                  descricao: "linhas de diamantes"
              ),

              Producto(
                  imageUrl: "assets/diamante_2.jpg",
                  nome: "Colar Escuros",
                  preco: 32000,
                  fabricante: "Angolana",
                  descricao: "especiarias de diamentes"
              )
          ]),
        Loja(
            uuid: "1UIEW432wwqkas",
            nome: "Império Das Joias",
            urlImage:"assets/loja_3.jpg",
            latLng: const  LatLng(-8.9018671 ,13.1781945),
            descricao: "loja angolana de joias e diamantes",
      lista: [
        Producto(
            imageUrl: "assets/diamante_5.jpg",
            nome: "Correntes",
            preco: 400000,
            fabricante: "Angolana",
            descricao: "Diamantes fino de ouro"
        ) ,

        Producto(
          imageUrl: "assets/diamante_1.jpg",
          nome: "Correntes de Fio",
          preco: 400000,
          fabricante: "Angolana",
          descricao: "corrente fina",

        ),

        Producto(
            imageUrl: "assets/diamante_4.jpg",
            nome: "Colar Fino",
            preco: 400000,
            fabricante: "Angolana",
            descricao: "linhas de diamantes"
        ),

        Producto(
            imageUrl: "assets/diamante_2.jpg",
            nome: "Colar Escuros",
            preco: 32000,
            fabricante: "Angolana",
            descricao: "especiarias de diamentes"
        ),
        Producto(
            imageUrl: "assets/diamante_2.jpg",
            nome: "teste",
            preco: 32000,
            fabricante: "Angolana",
            descricao: "especiarias de diamentes"
        )
      ]),
];


