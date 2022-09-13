import 'package:flutter/material.dart';
import 'package:inicial/controllers/reporte_controller.dart';
import 'package:inicial/services/void_state_validator.dart';
import 'package:inicial/ui/widgets/formulario_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/reporte_modelo.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();

  String titulo = "Reporte App";

  final reporteController = ReporteController();

  final Formulario formulario = Formulario();

  late var colorCheckIcon;

  @override
  void initState() {
    reporteController.pasajeros.pasajerosMsg = "";
    colorCheckIcon = Colors.white;
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

  /// SnackBar Function
  snackBar(var text, var color, var icono) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(icono, color: color, size: 30),
          SizedBox(width: 6),
          Text(text, style: TextStyle(color: color, fontSize: 18)),
        ],
      ),
    ));
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
          actions: [
            Builder(builder: (context) {
              return InkWell(
                child: Icon(
                  Icons.checklist_rtl,
                  color: colorCheckIcon,
                  size: 30,
                ),
                onTap: () {
                  if (reporteController.validateIsEmpty()) {
                    snackBar(
                        "Datos verificados!!!", Colors.green, Icons.gpp_good);
                  } else {
                    snackBar(
                        "Faltan datos!!!", Colors.red, Icons.warning_amber);
                  }
                  ;
                },
              );
            }),
            SizedBox(width: 15)
          ],
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
                    content: const Text('Algún campo sin llenar?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancelar', style: Theme.of(context).textTheme.button),
                      ),
                      TextButton(
                        onPressed: () => {
                          if (reporteController.validateIsEmpty())
                            // && pasajerosSeleccionadosList.isNotEmpty)
                            {
                              print("Todos estan llenos"),
                              Navigator.pushNamed(context, '/pasajeros_page'),
                            }
                          else
                            {
                              print("Alguno esta vacio"),
                              Navigator.pop(context),
                              snackBar("Faltan datos!!!", Colors.red,
                                  Icons.warning_amber)
                            }
                        },
                        child: Text('Enviar', style: Theme.of(context).textTheme.button),
                      ),
                    ],
                  ),
                );
              },
              tooltip: 'Increment',
              child: Icon(Icons.people_rounded),
              backgroundColor: Theme.of(context).primaryColor,
            );
          },
        ),

        /// Se puede usar Column pero son muchos elementos y no caben en la pantalla
        body: Formulario());
  }
}
