import 'package:flutter/material.dart';
import 'package:reporte/controllers/reporte_controller.dart';


class HoraInicioWidget extends StatefulWidget {
  const HoraInicioWidget({Key? key}) : super(key: key);

  @override
  State<HoraInicioWidget> createState() => _HoraInicioWidgetState();
}

class _HoraInicioWidgetState extends State<HoraInicioWidget> {

  ReporteController reporteController = ReporteController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(2, 1, 0, 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4)),
      child: Column(children: <Widget>[
        Row(
          children: [
            Text(
              "Hora de Inicio",
              style: Theme.of(context).textTheme.button,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.access_time, color: Theme.of(context).primaryColor, size: 40),
            // SizedBox(width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                        child: Text(
                            reporteController.reporte.horaInicio
                                .toString(),
                            style: TextStyle(fontSize: 20)))),
                SizedBox(
                  width: 8.0,
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey)),
                    onPressed: () {

                      // final DateTime now = DateTime.now();
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: 8, minute: 0),
                      ).then((TimeOfDay? value) {
                        if (value != null) {
                          print(value.format(context).toString());
                          setState(() {
                            reporteController.reporte.horaInicio =
                                value.format(context).toString();
                          });
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.wb_sunny, color: Theme.of(context).primaryColor),
                        Text(
                          'Seleccionar Hora',
                          style: Theme.of(context).textTheme.button,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}

