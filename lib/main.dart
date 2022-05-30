
import 'package:endiama_app/app/boostrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main()=>runApp(
    ModularApp(
        module:BootstrapModule(),
        child: AppWidget()
    )
);

