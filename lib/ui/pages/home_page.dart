import 'package:flutter/material.dart';
import 'package:inicial/controllers/main_controller.dart';
import 'package:inicial/controllers/theme_controller.dart';
import 'package:inicial/services/http_request_services.dart';
import 'package:inicial/ui/pages/informacio_usuario_page.dart';
import 'package:inicial/ui/pages/lista_contactos_page.dart';
import 'package:inicial/ui/pages/noticias_pages.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'form_usuario_page.dart';

List<Widget> pages = [
  ListaContactosPage(),
  InformacionUsuarioPage(),
  NoticiasPage(),
];

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String titulo = "AppBar";
  int picker = 0;

  Future<String> descargaImagen() async {
    print("Se inicia la descarga de la imagen");
    await Future.delayed(Duration(seconds: 2), () {});
    return "Se descargo la imagen";
  }

  ThemeController _controller = ThemeController.instancia;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(children: <Widget>[
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: Container(
                  color: Theme.of(context).primaryColor,
                )),
            ListTile(
              leading: Icon(MdiIcons.homeCircle),
              title: Text('Inicio'),
              onTap: () {
                setState(() {
                  picker = 0;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(MdiIcons.accountBox),
              title: Text('Usuario'),
              onTap: () {
                setState(() {
                  picker = 1;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(MdiIcons.newspaper),
              title: Text('Noticias'),
              onTap: () {
                setState(() {
                  picker = 2;
                  Navigator.pop(context);
                });
              },
            ),
          ]),
        ),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.

          actions: <Widget>[
            picker == 1
                ? IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      Navigator.pushNamed(context, 'form_usuario');

                      //   print("Se presiono el boton");
                      //
                      //   descargaImagen().then(
                      //           (value) {
                      //       print(value);
                      //       print("Se esta mostrando la imagen");
                      // });

                      // await descargaImagen();
                    },
                  )
                : SizedBox()
          ],

          title: Text(titulo),
        ),
        floatingActionButton: Builder(
          builder: (BuildContext context) {
            return FloatingActionButton(
              onPressed: () async {
                _controller.changeTheme(false);
                presionandoBoton();
                var resultado = await obtenerNoticias();
                if (resultado != null) {
                  print(resultado);
                } else {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('No hay conexion a internet'),duration: Duration(seconds: 1),));
                }
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          },
        ),

        /// Se puede usar Column pero son muchos elementos y no caben en la pantalla
        body: pages[picker]);
  }
}
