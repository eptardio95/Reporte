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

  _textMe(msg) async {
    String uri =
        'sms:${reporteController.telefonos.telefonoEduardito}?body=$msg';

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
                  color: Theme.of(context).primaryColor,
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
                /// Show dialog ///

                await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Confirmación de Reporte'),
                    content:
                        const Text('Está seguro de enviar el reporte vía SMS?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () => {
                          Navigator.pop(context),
                          _textMe(msg)},
                        child: const Text('Enviar'),
                      ),
                    ],
                  ),
                );
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
