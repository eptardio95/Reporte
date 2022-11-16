import 'package:flutter/material.dart';
import 'package:reporte/ui/widgets/pasajeros_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/reporte_controller.dart';

class PasajerosPage extends StatefulWidget {
  const PasajerosPage({Key? key}) : super(key: key);

  @override
  State<PasajerosPage> createState() => _PasajerosPageState();
}

class _PasajerosPageState extends State<PasajerosPage> {
  final reporteController = ReporteController();
  final List<String> pasajerosSeleccionadosList = [];
  String? msg;

  /// Funcion. Envia el mensaje ya conformado
  _textMe(numero, msg) async {
    String uri =
        'sms:${reporteController.telefonos.agenda![numero].toString()}?body=$msg';
    await launch(uri);
  }

  /// SnackBar Function
  snackBar(var text, var color, var icono) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(milliseconds: 1600),
      content: Row(
        children: [
          Icon(icono, color: color, size: 30),
          SizedBox(width: 6),
          Text(text, style: TextStyle(color: color, fontSize: 18)),
        ],
      ),
    ));
  }

  /// Seleccion de pasajeros
  seleccionPasajeros() {
    pasajerosSeleccionadosList.clear();
    for (var i = 0;
        i < reporteController.checkBoxListModelo.checkBoxList!.length;
        i++) {
      if (reporteController.checkBoxListModelo.checkBoxList![i] == true) {
        pasajerosSeleccionadosList
            .add(reporteController.pasajeros.pasajerosListAbreviados![i]);
      }
    }
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
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back, size: 30),
              onPressed: () {
                Navigator.pushNamed(context, '/home_page');
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          Builder(builder: (context) {
            return InkWell(
              child: const Icon(
                Icons.checklist_rtl,
                size: 30,
              ),
              onTap: () async {
                await seleccionPasajeros();

                if (pasajerosSeleccionadosList.isNotEmpty) {
                  print(pasajerosSeleccionadosList);
                  snackBar(
                      "Datos verificados!!!", Colors.green, Icons.gpp_good);
                } else {
                  print(pasajerosSeleccionadosList);
                  snackBar("Faltan datos!!!", Colors.red, Icons.warning_amber);
                }
                ;
              },
            );
          }),
          SizedBox(width: 15)
        ],
        title: Text("Reporte App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await seleccionPasajeros();

          reporteController.pasajeros.pasajerosMsg =
              "Pas: ${pasajerosSeleccionadosList.join(', ')}";

          /// Creacion del String msg
          msg = """${reporteController.reporte.fecha}\n
            ${reporteController.reporte.chapa}\n
            Od: ${reporteController.reporte.odometro}\n
            HInic: ${reporteController.reporte.horaInicio}\n
            HFin: ${reporteController.reporte.horaLlegada}\n
            ${reporteController.pasajeros.pasajerosMsg}\n
            Recorr: ${reporteController.reporte.recorrido}""";

          /// AlertDialog
          await showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Confirmación de Reporte'),
              content: const Text('Está seguro de enviar el reporte vía SMS?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancelar',
                      style: Theme.of(context).textTheme.button),
                ),
                TextButton(
                  onPressed: () => {
                    if (reporteController.validateIsEmpty() &&
                        pasajerosSeleccionadosList.isNotEmpty)
                      {
                        print("Todos estan llenos"),
                        Navigator.pop(context),
                        _textMe(reporteController.reporte.destinatario, msg),
                      }
                    else
                      {
                        print("Alguno esta vacio"),
                        Navigator.pop(context),
                        snackBar(
                            "Faltan datos!!!", Colors.red, Icons.warning_amber)
                      }
                  },
                  child:
                      Text('Enviar', style: Theme.of(context).textTheme.button),
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.message_sharp),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: PasajerosWidget(),
    );
  }
}
