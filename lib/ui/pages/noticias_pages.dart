import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inicial/models/noticias_modelo.dart';
import 'package:inicial/services/http_request_services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NoticiasPage extends StatelessWidget {
  List lista = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: obtenerNoticias(),
      builder: (context, respuesta) {
        if (respuesta.hasData) {
          Map noticiasJson = jsonDecode(respuesta.data.toString());
          print(respuesta.data);
          print("noticias: ${noticiasJson}");
          print(respuesta.data.runtimeType);

          // noticiasJson.forEach((key, value) {
          // });

          return ListView.builder(
              itemCount: noticiasJson.length,
              itemBuilder: (context, ptr) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(ptr.toString()),
                  ),
                  title: Text(noticiasJson.keys.elementAt(ptr),
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  subtitle: Text(noticiasJson.values.elementAt(ptr)),

                onTap: (){
                    print(noticiasJson.values.elementAt(ptr));
                    launchUrlString(noticiasJson.values.elementAt(ptr));
                },
                );
              });
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
