import 'package:flutter/material.dart';
import 'package:inicial/controllers/reporte_controller.dart';
import 'package:inicial/models/reporte_modelo.dart';
import 'package:inicial/ui/widgets/dropdown_button_widget.dart';

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
    return SingleChildScrollView(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: <Widget>[
            ///Chapa del carro///
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.abc, color: Colors.blue, size: 45),
                  // suffixIcon:,
                  labelText: 'Chapa del carro',
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor))),
              onChanged: (value) {
                reporteController.reporte.chapa = value;

              },
              controller: _chapaController,
            ),
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
                          BorderSide(color: Theme.of(context).primaryColor))),
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
                          BorderSide(color: Theme.of(context).primaryColor))),
              onChanged: (value) {
                reporteController.reporte.fecha = value;
              },
              controller: _fechaController,
            ),

            SizedBox(height: 8.0),

            ///Hora de Inicio///
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.access_time,
                      color: Colors.blue, size: 45),
                  // suffixIcon: const Icon(Icons.abc),
                  labelText: 'Hora de Inicio',
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor))),
              onChanged: (value) {
                reporteController.reporte.horaInicio = value;
              },
              controller: _horaInicioController,
            ),
            SizedBox(height: 8.0),

            ///Hora de llegada///
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.access_time_filled,
                      color: Colors.blue, size: 45),
                  // suffixIcon: const Icon(Icons.abc),
                  labelText: 'Hora de llegada',
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor))),
              onChanged: (value) {
                reporteController.reporte.horaLlegada = value;
              },
              controller: _horaLlegadaController,
            ),
            SizedBox(height: 15.0),

            ///Destinatario///
            DropdownButtonWidget(),

            SizedBox(height: 8.0),

            ///Recorrido///
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.route, color: Colors.blue, size: 45),
                  // suffixIcon: const Icon(Icons.abc),
                  labelText: 'Recorrido',
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor))),
              onChanged: (value) {
                reporteController.reporte.recorrido = value;
              },
              controller: _recorridoController,
            ),

          ]),
        ),
      ),
    );
  }
}
