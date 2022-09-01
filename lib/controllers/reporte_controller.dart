import 'package:flutter/material.dart';
import 'package:inicial/models/reporte_modelo.dart';


class ReporteController {


  static final ReporteController _instance = ReporteController._internal();

  factory ReporteController(){
    return _instance;
  }

  ReporteController._internal();

  Reporte reporte = Reporte();

  Telefonos telefonos = Telefonos();

  String? btnSelectedVal;
  bool? checkVoidState;

}