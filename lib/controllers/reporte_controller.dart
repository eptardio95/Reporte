import 'package:flutter/material.dart';
import 'package:inicial/models/reporte_modelo.dart';
import 'package:inicial/services/void_state_validator.dart';


class ReporteController {


  static final ReporteController _instance = ReporteController._internal();

  factory ReporteController(){
    return _instance;
  }

  ReporteController._internal();

  Reporte reporte = Reporte();

  Telefonos telefonos = Telefonos();

  String? btnSelectedVal;

  String? msg;

  TextEditControllerModelo odometroController = TextEditControllerModelo();

  bool validateIsEmpty() {
    if (reporte.chapa != null &&
        reporte.odometro != null &&
        reporte.fecha != null &&
        reporte.horaInicio != null &&
        reporte.horaLlegada != null &&
        reporte.destinatario != null &&
        reporte.destinatario != null) {
      print("Ninguno esta vacio");

      return false;
    } else {
      print("Aun alguno esta vacio EMPTY");
      return true;
    }
  }



}


