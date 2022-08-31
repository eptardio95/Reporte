import 'package:flutter/material.dart';
import 'package:inicial/models/reporte_modelo.dart';


class ReporteController {


  static final ReporteController _instance = ReporteController._internal();

  factory ReporteController(){
    return _instance;
  }

  ReporteController._internal();

  Reporte reporte = Reporte();

  // ValueNotifier <List<PersonaModelo>> contactos = ValueNotifier<List<PersonaModelo>>(persons);
}