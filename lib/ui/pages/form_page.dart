import 'package:flutter/material.dart';
import 'package:inicial/controllers/reporte_controller.dart';
import 'package:inicial/models/reporte_modelo.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

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
  late TextEditingController _destinatarioController;

  final reporteController = ReporteController();

  static const menuItems = <String>[
    "-- Seleccione el destinatario --",
    "Eduardo",
    "Marlon",
    "Asmel",
    "Yosbel"
  ];

  String _btnSelectedVal = "-- Seleccione el destinatario --";

  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  @override
  void initState() {
    super.initState();
    _chapaController = TextEditingController(text: "");
    _odometroController = TextEditingController(text: "");
    _fechaController = TextEditingController(text: "");
    _recorridoController = TextEditingController(text: "");
    _horaInicioController = TextEditingController(text: "");
    _horaLlegadaController = TextEditingController(text: "");
    _destinatarioController = TextEditingController(text: "");
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
                print(reporteController.reporte.chapa);
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
                print(reporteController.reporte.odometro);
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
                print(reporteController.reporte.fecha);
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
                print(reporteController.reporte.horaInicio);
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
                print(reporteController.reporte.horaLlegada);
              },
              controller: _horaLlegadaController,
            ),
            SizedBox(height: 15.0),

            ///Destinatario///
            Column(children: <Widget>[
              Container(
                // decoration: BoxDecoration(color: Colors.red),
                alignment: Alignment.topLeft,
                child: const Text("Destinatario",
                    style: TextStyle(color: Colors.blue, fontSize: 16.0)),
              ),
              DropdownButton<String>(
                isExpanded: true,
                value: _btnSelectedVal,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() => _btnSelectedVal = newValue);

                  }
                },
                items: _dropDownMenuItems,
              ),
            ]),
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
                print(reporteController.reporte.recorrido);
              },
              controller: _recorridoController,
            ),

            // TextFormField(
            //   decoration: InputDecoration(
            //       prefixIcon:
            //           const Icon(Icons.person, color: Colors.blue, size: 45),
            //       // suffixIcon: const Icon(Icons.abc),
            //       labelText: 'Destinatario',
            //       border: OutlineInputBorder(
            //           borderSide:
            //               BorderSide(color: Theme.of(context).primaryColor))),
            //   onChanged: (value) {
            //     reporteController.reporte.destinatario = value;
            //     print(reporteController.reporte.destinatario);
            //   },
            //   controller: _destinatarioController,
            // ),
          ]),
        ),
      ),
    );
  }
}
