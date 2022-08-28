import 'package:flutter/material.dart';
import 'package:inicial/models/persona_modelo.dart';
import 'package:inicial/ui/pages/home_page.dart';


class DetallesContactoPage extends StatelessWidget {

  DetallesContactoPageArguments? arg;

  DetallesContactoPage({
    Key? key,
    this.arg}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    // final DetallesContactoPageArguments argumentos = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      appBar: AppBar(
        title: Text(
          arg!.persona!.nickname!
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(arg!.contenido),
      ),
    );
  }
}

class DetallesContactoPageArguments {
  final PersonaModelo? persona;
  final String contenido;

  DetallesContactoPageArguments({this.persona, this.contenido = "Contenido"});

}