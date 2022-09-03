import 'package:flutter/material.dart';
import 'package:inicial/controllers/reporte_controller.dart';
import 'package:inicial/models/reporte_modelo.dart';

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({Key? key}) : super(key: key);

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  final reporteController = ReporteController();

  static const destinatarioItems = <String>[
    "Eduardo",
    "Marlon",
    "Asmel",
    "Yosbel"
  ];

  final List<DropdownMenuItem<String>> _dropDownDestinatarioItems =
      destinatarioItems
          .map(
            (String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ),
          )
          .toList();

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        // decoration: BoxDecoration(color: Colors.red),
        alignment: Alignment.topLeft,
        child: const Text("Destinatario",
            style: TextStyle(color: Colors.blue, fontSize: 16.0)),
      ),
      DropdownButton<String>(
        isExpanded: true,
        value: reporteController.reporte.destinatario,
        onChanged: (String? value) {
          if (value != null) {
            setState(() => reporteController.reporte.destinatario = value);
            print(value);
          }
        },
        items: _dropDownDestinatarioItems,
      ),
    ]);
  }
}
