import 'package:flutter/material.dart';
import 'package:inicial/controllers/reporte_controller.dart';

class PasajerosListViewWidget extends StatefulWidget {
  PasajerosListViewWidget({Key? key}) : super(key: key);

  @override
  State<PasajerosListViewWidget> createState() =>
      _PasajerosListViewWidgetState();
}

class _PasajerosListViewWidgetState extends State<PasajerosListViewWidget> {
  ReporteController reporteController = ReporteController();

  @override
  Widget build(BuildContext context) {
    const _biggerFont = TextStyle(fontSize: 18.0);

    Widget _buildRow(int id) {
      return ListTile(
        leading: Checkbox(
          onChanged: (bool? value) {
            if (value != null) {
              setState(() => reporteController
                  .checkBoxListModelo.checkBoxList![id] = value);
            }
          },
          value: reporteController.checkBoxListModelo.checkBoxList![id],
        ),
        title: Text(
          reporteController.pasajeros.pasajerosList![id],
          style: _biggerFont,
        ),
        // trailing: const Icon(Icons.accessibility_new_outlined, color: Color.fromRGBO(
        //     25, 199, 28, 1.0)),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: reporteController.pasajeros.pasajerosList!.length,
      itemBuilder: (BuildContext context, int i) {
        return _buildRow(i);
      },
    );
  }
}
