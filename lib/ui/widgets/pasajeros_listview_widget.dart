import 'package:flutter/material.dart';
import 'package:inicial/controllers/reporte_controller.dart';

class ListViewBuilderExample extends StatefulWidget {
  ListViewBuilderExample({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderExample> createState() => _ListViewBuilderExampleState();
}

class _ListViewBuilderExampleState extends State<ListViewBuilderExample> {
  ReporteController reporteController = ReporteController();

  @override
  Widget build(BuildContext context) {
    const _biggerFont = TextStyle(fontSize: 18.0);

    Widget _buildRow(int id) {
      return ListTile(
        leading: CircleAvatar(
          child: Text('$id', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        title: Text(
          reporteController.pasajeros.pasajerosList![id],
          style: _biggerFont,
        ),
        trailing: const Icon(Icons.check_rounded, color: Color.fromRGBO(
            25, 199, 28, 1.0)),
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
