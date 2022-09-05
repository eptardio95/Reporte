import 'package:flutter/material.dart';
import 'package:inicial/controllers/reporte_controller.dart';
import 'package:inicial/models/reporte_modelo.dart';
import 'package:inicial/ui/widgets/chapa_dropdown_button_widget.dart';
import 'package:inicial/ui/widgets/destinatario_dropdown_button_widget.dart';
import 'package:inicial/ui/widgets/recorrido_textfield_widget.dart';

import '../widgets/hora_inicio_widget.dart';
import '../widgets/hora_llegada_widget.dart';

class Formulario extends StatefulWidget {
  Formulario({Key? key}) : super(key: key);

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  late TextEditingController _chapaController;
  late TextEditingController _odometroController;
  late TextEditingController _fechaController;
  late TextEditingController _recorridoController;
  late TextEditingController _horaInicioController;
  late TextEditingController _horaLlegadaController;

  final reporteController = ReporteController();

  @override
  void initState() {
    super.initState();
    _chapaController = TextEditingController(text: "");
    _odometroController = TextEditingController(text: "");
    _fechaController = TextEditingController(text: "");
    _recorridoController = TextEditingController(text: "");
    _horaInicioController = TextEditingController(text: "");
    _horaLlegadaController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    reporteController.reporte.horaInicio = "08:00 AM";
    reporteController.reporte.horaLlegada = "05:00 PM";

    return SingleChildScrollView(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: <Widget>[

            ///Chapa del carro///
            ChapaDropdownButtonWidget(),

            SizedBox(height: 8.0),

            ///Odometro///
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon:
                  const Icon(Icons.numbers, color: Colors.blue, size: 45),
                  // suffixIcon: const Icon(Icons.abc),
                  labelText: "Odómetro Final",
                  border: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Theme
                          .of(context)
                          .primaryColor))),
              onChanged: (value) {
                reporteController.reporte.odometro = value;
              },
              controller: _odometroController,
            ),
            SizedBox(height: 8.0),

            ///Fecha///
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.date_range,
                      color: Colors.blue, size: 45),
                  // suffixIcon: const Icon(Icons.abc),
                  labelText: 'Fecha',
                  border: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Theme
                          .of(context)
                          .primaryColor))),
              onChanged: (value) {
                reporteController.reporte.fecha = value;
                // final String now = DateTime.now().day.toString();
                final DateTime now = DateTime.now();
                final String fechaHoy = "${now.day}/${now.month}/${now.year}";
                setState(() =>
                reporteController.reporte.fecha = fechaHoy
                );
              },
              controller: _fechaController,
            ),

            SizedBox(height: 8.0),

            ///Hora de Inicio///

            HoraInicioWidget(),

            SizedBox(height: 8.0),

            ///Hora de llegada///

            HoraLlegadaWidget(),

            SizedBox(height: 15.0),

            ///Destinatario///
            DestinatarioDropdownButtonWidget(),

            SizedBox(height: 8.0),

            ///Recorrido///
            RecorridoTextfieldWidget(),
          ]),
        ),
      ),
    );
  }
}
