import 'package:endiama_app/app/autenticacao/widgets/logo_widget.dart';
import 'package:endiama_app/app/shared/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AutenticacaoPage extends StatefulWidget {
  @override
  _AutenticacaoPageState createState() => _AutenticacaoPageState();
}

class _AutenticacaoPageState extends State<AutenticacaoPage> {

  TextEditingController _emailEditingController = new TextEditingController();
  TextEditingController _passwordEditingController =  new TextEditingController();

  GlobalKey<FormState> _formCredential =  new GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
       backgroundColor: Colors.white,
       body: Form(
            key: _formCredential,
            child: Container(
              margin:EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Center(
                child: SingleChildScrollView(
                    child: Container(
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LogoCard(),
                          SizedBox(height:20,),
                          TextField(
                              controller: _emailEditingController ,
                              decoration: const InputDecoration(
                                  hintText: "email",
                              ),
                          ),
                          SizedBox(height:40,),
                          TextField(
                            controller: _passwordEditingController,
                            obscureText:true,
                            decoration: const  InputDecoration(
                              hintText: "senha"
                            ),
                           ),
                          SizedBox(height:25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                               Text("Esqueceu a palavra passe ?", style: TextStyle().copyWith(
                                   fontSize: 14,
                                   color: SUBTITULO
                               ),)
                            ],
                          ),
                          SizedBox(height:60),
                          MaterialButton(
                            onPressed: () => Modular.to.navigate('/autenticacao/introduction'),
                            color: BOTAO,
                            child:Text("Entrar" ,style: TextStyle().copyWith(
                              color: Colors.white,
                              fontSize: 16,
                            ),),
                            minWidth: 250,
                            height:60,)
                        ],
                      ),
                    ),
                ),
              ),
            )
       ),
    );
  }
}
