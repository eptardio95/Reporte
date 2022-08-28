import 'package:flutter/material.dart';
import 'package:inicial/controllers/theme_controller.dart';
import 'package:inicial/ui/pages/detalles_contacto_page.dart';
import 'package:inicial/ui/pages/error_page.dart';
import 'package:inicial/ui/pages/form_contact_page.dart';
import 'package:inicial/ui/pages/form_usuario_page.dart';
import 'package:inicial/ui/pages/home_page.dart';
import 'ui/pages/home_page.dart';

void main() {

  ErrorWidget.builder = (FlutterErrorDetails details)=> ErrorPage(details: details);
  runApp(MyApp());
}

ThemeController _controller = ThemeController.instancia;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("4444444444444444444444");
    print(_controller.isDark);
    return ValueListenableBuilder(
      valueListenable: _controller.isDark,
      builder: (context, value, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (settings) {
              if (settings.name == 'detalle_contacto') {
                final args =
                    settings.arguments as DetallesContactoPageArguments;

                return MaterialPageRoute(
                  builder: (context) {
                    return DetallesContactoPage(
                      arg: args,
                    );
                  },
                );
              } else if (settings.name == 'form_contacto') {
                final args = settings.arguments as FormContactoPageArguments;
                print(value);
                print("**************************************************");
                return MaterialPageRoute(
                  builder: (context) {
                    return FormContactoPage(arg: args);
                  },
                );
              } else if (settings.name == 'form_usuario') {
                return MaterialPageRoute(
                  builder: (context) {
                    return FormUsuarioPage();
                  },
                );
              }
            },

            //   routes: {
            //     'detalle_contacto':(context) => DetallesContactoPage(),
            //     'form_contacto': (context) => FormContactoPage(),
            //   },
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
