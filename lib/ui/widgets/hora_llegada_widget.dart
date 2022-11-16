import 'package:flutter/material.dart';
import 'package:reporte/controllers/reporte_controller.dart';


class HoraLlegadaWidget extends StatefulWidget {
  const HoraLlegadaWidget({Key? key}) : super(key: key);

  @override
  State<HoraLlegadaWidget> createState() => _HoraLlegadaWidgetState();
}

class _HoraLlegadaWidgetState extends State<HoraLlegadaWidget> {
  @override
  Widget build(BuildContext context) {

    ReporteController reporteController = ReporteController();

    return Container(
      padding: EdgeInsets.fromLTRB(2, 1, 0, 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4)),
      child: Column(children: <Widget>[
        Row(
          children: [
            Text(
              "Hora de Llegada",
              style: Theme.of(context).textTheme.button,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.access_time_filled,
                color: Theme.of(context).primaryColor, size: 40),
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
                            reporteController.reporte.horaLlegada
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
                        initialTime: TimeOfDay(hour: 17, minute: 0),
                      ).then((TimeOfDay? value) {
                        if (value != null) {
                          print(value.format(context).toString());
                          setState(() {
                            reporteController.reporte.horaLlegada =
                                value.format(context).toString();
                          });
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.nights_stay, color: Theme.of(context).primaryColor),
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
