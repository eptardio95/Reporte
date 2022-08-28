import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final FlutterErrorDetails? details;

  ErrorPage({Key? key, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(

        child: RaisedButton(
          onPressed: () {
            print("Se envio la info del error al servidor para ser revisado1111");
          },
          child: Text("Reportar Error"),

          ///stack: en detalles el error obtenido
          // child: Text(details!.stack.toString()),
        ),
      ),
    );
  }
}
