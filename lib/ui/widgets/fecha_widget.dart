import 'package:flutter/material.dart';

import '../../controllers/reporte_controller.dart';

class FechaWidget extends StatefulWidget {
  const FechaWidget({Key? key}) : super(key: key);

  @override
  State<FechaWidget> createState() => _FechaWidgetState();
}

class _FechaWidgetState extends State<FechaWidget> {
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
              "Fecha del Reporte",
              style: Theme.of(context).textTheme.button,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.calendar_month, color: Theme.of(context).primaryColor, size: 35),
            // SizedBox(width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.black),
                        ),
                    child: Center(
                        child: Text("${reporteController.reporte.fecha!}/${DateTime.now().year}",
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
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2018),
                        lastDate: DateTime(2025),
                      ).then((DateTime? value) {
                        if (value != null) {
                          DateTime _fromDate = DateTime.now();
                          _fromDate = value;
                          setState(() {
                            reporteController.reporte.fecha =
                                "${value.day}/${value.month}";
                          });
                          // final String date = DateFormat.yMMMd().format(_fromDate);
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.calendar_month,color: Theme.of(context).primaryColor),
                        Text(
                          'Seleccionar Fecha',
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
