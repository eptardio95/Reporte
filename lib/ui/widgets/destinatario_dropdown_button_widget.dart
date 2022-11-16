import 'package:flutter/material.dart';
import 'package:reporte/controllers/reporte_controller.dart';
import 'package:reporte/models/reporte_modelo.dart';

class DestinatarioDropdownButtonWidget extends StatefulWidget {
  const DestinatarioDropdownButtonWidget({Key? key}) : super(key: key);

  @override
  State<DestinatarioDropdownButtonWidget> createState() =>
      _DestinatarioDropdownButtonWidgetState();
}

class _DestinatarioDropdownButtonWidgetState
    extends State<DestinatarioDropdownButtonWidget> {
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
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
        Text("Destinatario",
            style: Theme.of(context).textTheme.button),
        DropdownButton<String>(
          style: Theme.of(context).textTheme.button,
          isExpanded: true,
          hint: Text("¿A quién va dirigido el parte?",
              style: TextStyle(color: Colors.grey)),
          value: reporteController.reporte.destinatario,
          onChanged: (String? value) {
            if (value != null) {
              setState(() => reporteController.reporte.destinatario = value);
              print(value);
            }
          },
          items: _dropDownDestinatarioItems,
        ),
      ]),
    );
  }
}
