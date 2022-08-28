import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inicial/services/shared_preferences_services.dart';

class InformacionUsuarioPage extends StatelessWidget {
  const InformacionUsuarioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.blue,
                        image: const DecorationImage(
                            image: AssetImage("assets/gato-blanco.jpg"),

                            // image: DecorationImage(image: NetworkImage("https://parahamster.net/wp-content/uploads/2019/05/gato-blanco.jpg"),

                            fit: BoxFit.cover)),
              ),
              FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString(
                    "assets/data.json"),
                builder: (context, resultado) {
                  if (resultado.hasData) {
                    final data = jsonDecode(resultado.data.toString());
                    print(data);

                    return Column(children: <Widget>[
                      Text(
                        data['nombre'],
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        data['telefono'],
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ]);
                  }
                  return Container();
                },
              ),
            ]));
  }
}