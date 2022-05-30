

class CardIntroduction{

      String titulo;
      String  pathImage;
      int    pageIndex;

      CardIntroduction({required this.pageIndex ,required this.titulo ,required this.pathImage});
}


final List<CardIntroduction> listaSlides = [
      CardIntroduction(pageIndex: 0, titulo: "FAÇA BUSCA DE CONTEUDOS DA ENDIAMA", pathImage: "assets/1.png"),
      CardIntroduction(pageIndex: 1, titulo: "RECEBA NOTIFICAÇÕES INSTANTANIAMENTE", pathImage: "assets/2.png"),
      CardIntroduction(pageIndex: 2, titulo: "FAÇA PUBLICAÇÕES DE CONTEUDOS", pathImage: "assets/3.png")
];