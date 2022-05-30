class Notificao{
     String  titulo ;
     bool  start =false;
     String  imagePath;
     String  descricao;

     Notificao({
       required  this.descricao,
       required this.start,
       required this.titulo,
       required this.imagePath
     });

}


final List<Notificao>  listaNotificacoes  = [
      Notificao(
          descricao: "O PCA da ENDIAMA E.P., José Manuel Ganga Júnior, disse hoje, 19 de \n Abril, em Luanda que a empresa tenciona produzir 10 milhões",
          start: true,
          titulo: "ENDIAMA tenciona produzir 10  \n milhões de quilates",
          imagePath: "assets/notificacao_1.jpg"
      )
];