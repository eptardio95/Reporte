import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reporte/controllers/reporte_controller.dart';
import 'package:reporte/ui/widgets/formulario_widget.dart';

class OdometroWidget extends StatefulWidget {
  const OdometroWidget({Key? key}) : super(key: key);

  @override
  State<OdometroWidget> createState() => _OdometroWidgetState();
}

class _OdometroWidgetState extends State<OdometroWidget> {
  ReporteController reporteController = ReporteController();



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
            Text("Odómetro Final", style: Theme.of(context).textTheme.button),
            TextFormField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.numbers, color: Theme.of(context).primaryColor, size: 45),
                  // suffixIcon: const Icon(Icons.abc),
                  // labelText: "Odómetro Final",
                  // border: OutlineInputBorder(
                  //     borderSide:
                          // BorderSide(color: Theme.of(context).primaryColor))
              ),
              onChanged: (value) {
                setState((){
                  reporteController.reporte.odometro = value;
                });
              },
              controller:
                  reporteController.odometroController.odometroController,
            ),
          ]),
    );
    //
  }
}
