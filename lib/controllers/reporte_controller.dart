import 'package:flutter/material.dart';
import 'package:inicial/models/reporte_modelo.dart';
import 'package:inicial/services/void_state_validator.dart';

class ReporteController {
  static final ReporteController _instance = ReporteController._internal();

  factory ReporteController() {
    return _instance;
  }

  ReporteController._internal();

  Reporte reporte = Reporte();

  Telefonos telefonos = Telefonos();

  String? btnSelectedVal;

  String? msg;

  TextEditControllerModelo odometroController = TextEditControllerModelo();

  bool validateIsEmpty() {
    if (["B223108", "B223105", "B222133", "B237834"].contains(reporte.chapa) &&
        reporte.odometro!.isNotEmpty &&
        reporte.fecha != "__/__" &&
        reporte.horaInicio != "__:__ AM" &&
        reporte.horaLlegada != "__:__ PM" &&
        ["Eduardo", "Marlon", "Asmel", "Yosbel"]
            .contains(reporte.destinatario) &&
        reporte.recorrido!.isNotEmpty) {

      return true;
    } else {
      print("Aun alguno esta vacio EMPTY");
      return false;
    }
  }

  Pasajeros pasajeros = Pasajeros();

  CheckBoxListModelo checkBoxListModelo = CheckBoxListModelo();

}
