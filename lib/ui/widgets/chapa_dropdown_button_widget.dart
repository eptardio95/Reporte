import 'package:flutter/material.dart';
import 'package:inicial/controllers/reporte_controller.dart';
import 'package:inicial/models/reporte_modelo.dart';

class ChapaDropdownButtonWidget extends StatefulWidget {
  const ChapaDropdownButtonWidget({Key? key}) : super(key: key);

  @override
  State<ChapaDropdownButtonWidget> createState() =>
      _ChapaDropdownButtonWidgetState();
}

class _ChapaDropdownButtonWidgetState extends State<ChapaDropdownButtonWidget> {
  final reporteController = ReporteController();

  static const chapaItems = <String>[
    "B223108",
    "B223105",
    "B222133",
    "B237834",
  ];

  final List<DropdownMenuItem<String>> _dropDownChapaItems = chapaItems
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
        borderRadius: BorderRadius.circular(4)
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Chapa", style: TextStyle(color: Colors.blue, fontSize: 16.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.abc, color: Colors.blue, size: 45),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: DropdownButton<String>(
                    alignment: Alignment.centerLeft,
                    hint: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          "Ingrese la chapa del vehículo                 ",
                          style: TextStyle(color: Colors.grey)),
                    ),
                    value: reporteController.reporte.chapa,
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() => reporteController.reporte.chapa = value);
                        print(value);
                      }
                    },
                    items: _dropDownChapaItems,
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
