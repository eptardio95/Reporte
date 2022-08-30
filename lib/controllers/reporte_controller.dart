import 'package:flutter/material.dart';
import 'package:inicial/models/reporte_modelo.dart';


class ReporteController {

  static List<Reporte> reportes = [
    reporteInicial,
    reporteInicial,
  ];

  static final ReporteController instancia = ReporteController._();

  ReporteController._();

  // ValueNotifier <List<PersonaModelo>> contactos = ValueNotifier<List<PersonaModelo>>(persons);
}