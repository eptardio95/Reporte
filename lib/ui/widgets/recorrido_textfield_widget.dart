import 'package:flutter/material.dart';
import 'package:inicial/controllers/reporte_controller.dart';

class RecorridoTextfieldWidget extends StatefulWidget {
  const RecorridoTextfieldWidget({Key? key}) : super(key: key);

  @override
  State<RecorridoTextfieldWidget> createState() =>
      _RecorridoTextfieldWidgetState();
}

class _RecorridoTextfieldWidgetState extends State<RecorridoTextfieldWidget> {
  late final TextEditingController _recorridoController;
  final reporteController = ReporteController();

  @override
  void initState() {
    super.initState();

    _recorridoController = TextEditingController(text: "");
  }

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
            const Text("Recorrido",
                style: TextStyle(color: Colors.blue, fontSize: 16.0)),
            TextField(
              maxLines: 2,
              decoration: const InputDecoration(
                  prefixIcon:
                      Icon(Icons.route, color: Colors.blue, size: 45),
                  // suffixIcon: const Icon(Icons.abc),
                  // labelText: 'Recorrido',
                  // border: OutlineInputBorder(
                  //     borderSide:
                  //         BorderSide(color: Theme.of(context).primaryColor))
              ),
              onChanged: (value) {
                reporteController.reporte.recorrido = value;
              },
              controller: _recorridoController,
            ),
          ]),
    );
  }
}
