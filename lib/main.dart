import 'package:flutter/material.dart';
import 'package:inicial/ui/pages/home_page.dart';
import 'package:inicial/ui/pages/pasajeros_page.dart';
import 'ui/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
            '/home_page':(context) => HomePage(),
            '/pasajeros_page': (context) => PasajerosPage(),
          },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          primaryColor: Color.fromRGBO(45, 44, 117, 1.0),
          appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(45, 44, 117, 1.0),
          ),
          textTheme: TextTheme(
            button: TextStyle(color: Color.fromRGBO(45, 44, 117, 1.0),fontSize: 16),

          )

        ),
        home: HomePage());
  }
}
