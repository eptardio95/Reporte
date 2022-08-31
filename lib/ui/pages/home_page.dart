import 'package:flutter/material.dart';
import 'package:inicial/controllers/reporte_controller.dart';
import 'package:inicial/ui/pages/form_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/reporte_modelo.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String titulo = "Reporte App";

  final reporteController = ReporteController();
  late Map<String, String?> mapaReporte;
  late String msg;
  static const telefonoEduardo = "+5352886390";

  _textMe(msg) async {

    String uri = 'sms:+${telefonoEduardo}?body=$msg';

    await launch(uri);
  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
          drawer: Drawer(
            child: Column(children: <Widget>[
              DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: Container(
                    color: Theme
                        .of(context)
                        .primaryColor,
                  )),
            ]),
          ),
          appBar: AppBar(
            title: Text(titulo),
          ),
          floatingActionButton: Builder(
            builder: (BuildContext context) {
              return FloatingActionButton(
                onPressed: () async {
                  mapaReporte = {
                    "Chapa": reporteController.reporte.chapa,
                    "Odómetro": reporteController.reporte.odometro,
                    "Fecha": reporteController.reporte.fecha,
                    "Recorrido": reporteController.reporte.recorrido,
                    "Hora de Inicio": reporteController.reporte.horaInicio,
                    "Hora de Llegada": reporteController.reporte.horaLlegada,
                    "Destinatario": reporteController.reporte.destinatario,
                  };

                  msg =
                  """Fecha: ${mapaReporte["Fecha"]}\nChapa: ${mapaReporte["Chapa"]}\nOdómetro: ${mapaReporte["Odómetro"]}\nHora de Inicio: ${mapaReporte["Hora de Inicio"]}\nHora de llegada: ${mapaReporte["Hora de llegada"]}\nRecorrido: ${mapaReporte["Recorrido"]}\nDestinatario: ${mapaReporte["Destinatario"]}""";
                  print(msg);

                  await _textMe(msg);


                  // print(reporteController.reporte.chapa);
                  // print(reporteController.reporte.odometro);
                  // print(reporteController.reporte.fecha);
                  // print(reporteController.reporte.recorrido);
                  // print(reporteController.reporte.horaInicio);
                  // print(reporteController.reporte.horaLlegada);
                  // print(reporteController.reporte.destinatario);
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              );
            },
          ),

          /// Se puede usar Column pero son muchos elementos y no caben en la pantalla
          body: Formulario());
    }
  }

