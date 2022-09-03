import 'package:flutter/material.dart';
import 'package:inicial/controllers/reporte_controller.dart';
import 'package:inicial/services/void_state_validator.dart';
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

  String? msg;
  final Formulario formulario = Formulario();

  _textMe(numero, msg) async {
    print(reporteController.telefonos.agenda![numero]);
    String uri =
        'sms:${reporteController.telefonos.agenda![numero].toString()}?body=$msg';
    await launch(uri);
  }

  @override
  void initState() {

    // Map <String, String?> mapaReporte = {
    //   "Chapa": reporteController.reporte.chapa,
    //   "Odómetro": reporteController.reporte.odometro,
    //   "Fecha": reporteController.reporte.fecha,
    //   "Recorrido": reporteController.reporte.recorrido,
    //   "Hora de Inicio": reporteController.reporte.horaInicio,
    //   "Hora de Llegada": reporteController.reporte.horaLlegada,
    //   "Destinatario": reporteController.reporte.destinatario,
    // };

        super.initState();
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
                          print("chapa ${reporteController.reporte.chapa}"),
                          print("odometro ${reporteController.reporte.odometro}"),
                          print(" hora i${reporteController.reporte.horaInicio}"),
                          print("hora f ${reporteController.reporte.horaLlegada}"),
                          print("destin ${reporteController.reporte.destinatario}"),
                          print("recorr ${reporteController.reporte.recorrido}"),

                          if (reporteController.validateIsEmpty())
                            {print("Existe algun campo vacio")}
                          else
                            {
                              print("No existen campos vacios"),
                              msg =
                              """Fecha: ${reporteController.reporte.fecha}\nChapa: ${reporteController.reporte.chapa}\nOdómetro: ${reporteController.reporte.odometro}\nHora de Inicio: ${reporteController.reporte.horaInicio}\nHora de llegada: ${reporteController.reporte.horaLlegada}\nRecorrido: ${reporteController.reporte.recorrido}\nDestinatario: ${reporteController.reporte.destinatario}""",

                            _textMe(reporteController.reporte.destinatario, msg),
                            }
                        },
                        child: const Text('Enviar'),
                      ),
                    ],
                  ),
                );
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
