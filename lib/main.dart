import 'package:flutter/material.dart';
import 'package:inicial/controllers/theme_controller.dart';
import 'package:inicial/ui/pages/detalles_contacto_page.dart';
import 'package:inicial/ui/pages/error_page.dart';
import 'package:inicial/ui/pages/form_contact_page.dart';
import 'package:inicial/ui/pages/form_usuario_page.dart';
import 'package:inicial/ui/pages/home_page.dart';
import 'ui/pages/home_page.dart';

void main() {

  runApp(MyApp());
}

ThemeController _controller = ThemeController.instancia;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: _controller.isDark,
      builder: (context, value, child) {
        return MaterialApp(

            title: 'Flutter Demo',
            theme: ThemeData(
              brightness: value == true ? Brightness.dark : Brightness.light,
              primarySwatch: Colors.blue,
            ),
            home: HomePage());
      },
    );
  }
}
