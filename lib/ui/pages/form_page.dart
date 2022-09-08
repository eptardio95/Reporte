import 'package:flutter/material.dart';
import 'package:inicial/controllers/reporte_controller.dart';
import 'package:inicial/models/reporte_modelo.dart';
import 'package:inicial/ui/widgets/chapa_dropdown_button_widget.dart';
import 'package:inicial/ui/widgets/destinatario_dropdown_button_widget.dart';
import 'package:inicial/ui/widgets/pasajeros_widget.dart';
import 'package:inicial/ui/widgets/recorrido_textfield_widget.dart';

import '../widgets/fecha_widget.dart';
import '../widgets/hora_inicio_widget.dart';
import '../widgets/hora_llegada_widget.dart';
import '../widgets/odometro_widget.dart';

class Formulario extends StatefulWidget {
  Formulario({Key? key}) : super(key: key);

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {


  final reporteController = ReporteController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    reporteController.reporte.horaInicio = "__:__ AM";
    reporteController.reporte.horaLlegada = "__:__ PM";
    reporteController.reporte.fecha = "__/__";
    reporteController.odometroController.odometroController = TextEditingController(text: "");

    return SingleChildScrollView(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: const <Widget>[

            ///Chapa del carro///
            ChapaDropdownButtonWidget(),

            SizedBox(height: 8.0),

            ///Odometro///
            OdometroWidget(),

            SizedBox(height: 8.0),

            ///Fecha///
            FechaWidget(),

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

            SizedBox(height: 8.0),

            PasajerosWidget(),
          ]),
        ),
      ),
    );
  }
}
