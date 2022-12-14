import 'package:flutter/material.dart';
import 'package:reporte/controllers/reporte_controller.dart';
import 'package:reporte/models/reporte_modelo.dart';
import 'package:reporte/ui/widgets/chapa_dropdown_button_widget.dart';
import 'package:reporte/ui/widgets/destinatario_dropdown_button_widget.dart';
import 'package:reporte/ui/widgets/pasajeros_widget.dart';
import 'package:reporte/ui/widgets/recorrido_textfield_widget.dart';

import 'fecha_widget.dart';
import 'hora_inicio_widget.dart';
import 'hora_llegada_widget.dart';
import 'odometro_widget.dart';

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
    // reporteController.reporte.chapa = "";
    reporteController.reporte.odometro = "";
    reporteController.reporte.fecha = "__/__";
    reporteController.reporte.horaInicio = "__:__ AM";
    reporteController.reporte.horaLlegada = "__:__ PM";
    // reporteController.reporte.destinatario = "";
    reporteController.reporte.recorrido = "";
    reporteController.odometroController.odometroController = TextEditingController(text: "");
    reporteController.checkBoxListModelo.checkBoxList = [false,false,false,false,false,false,false,false,false,false];

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
          ]),
        ),
      ),
    );
  }
}
