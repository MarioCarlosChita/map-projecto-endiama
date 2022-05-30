import 'dart:async';

import 'package:endiama_app/app/autenticacao/widgets/card_widget_introduction.dart';
import 'package:endiama_app/app/autenticacao/widgets/logo_widget.dart';
import 'package:endiama_app/app/autenticacao/widgets/model/card.dart';
import 'package:endiama_app/app/autenticacao/widgets/radio_widget.dart';
import 'package:endiama_app/app/shared/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class IntroducaoSlidePage extends StatefulWidget {
  @override
  _IntroducaoSlidePageState createState() => _IntroducaoSlidePageState();
}

class _IntroducaoSlidePageState extends State<IntroducaoSlidePage> {

  StreamController<int> _pageIndexController =  new StreamController.broadcast();
  PageController _pageController = new PageController(initialPage: 0);

  int DefaultPage = 2;

  @override
  void initState() {
    super.initState();
  }


  void dispose(){
      super.dispose();
      _pageIndexController.close();
      _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
       double _deviceScreenHeight = MediaQuery.of(context).size.height;

       return Scaffold(
         backgroundColor: Colors.white,
         body: Container(
            child: Center(
                child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LogoCard(),
                      SizedBox(height:10,),
                      Container(
                        height:_deviceScreenHeight / 2,
                        // child: _slideIntroductionPage(),
                        child: PageView(
                           children:_slideIntroductionPage(),
                           controller: _pageController,
                           onPageChanged: (int page){
                              _pageIndexController.sink.add(page);
                           },
                        ),
                      ),
                      SizedBox(height:5),
                      StreamBuilder<int>(
                        stream: _pageIndexController.stream,
                        initialData: 0,
                        builder: (_ , pageIndex){
                           return  Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment:MainAxisAlignment.center,
                             children: [
                               for(int  index = 0 ; index <_radioIntroductionPage().length  ; ++index)
                                     _radioIntroductionPage()[index].RadioWidget(pageIndex:pageIndex.data??0)
                             ],
                           );
                        },
                      ),
                      SizedBox(height:60,),

                      StreamBuilder<int>(
                          initialData: 0,
                          stream: _pageIndexController.stream,
                          builder:(_ ,page){
                            return  MaterialButton(
                                onPressed: () {
                                   if(page.data == DefaultPage) {
                                       Modular.to.navigate('/autenticacao/home');
                                   } else {
                                       int currentPage = page.data ?? 0;
                                       int nextPage   =  currentPage  < DefaultPage ? currentPage + 1:DefaultPage;
                                       _pageController.jumpToPage(nextPage);
                                   }
                                },
                                color: BOTAO,
                                child:Text(page.data ==  DefaultPage ? "Começar":"Proximo",style: TextStyle().copyWith(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),),
                                minWidth: 250,
                                height:60
                            );
                          }
                      )
                    ],
                ),
            ),
         ),
       );
  }

  List<Widget> _slideIntroductionPage() {
    List<Widget> _slide = [];
    for (int   index= 0; index < listaSlides.length  ; ++index) {
      _slide.add(CardIntroductionWidget( cardIntroduction: listaSlides[index]));
    }
     return _slide;
  }

  List<RadioPoint> _radioIntroductionPage() {
    List<RadioPoint> _slide = [];
    for (int   index= 0; index < listaSlides.length  ; ++index)
          _slide.add(RadioPoint(page: index));

    return  _slide;
  }



}
