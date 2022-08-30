import 'package:flutter/material.dart';

class Reporte {
  String? chapa;
  String? odometro;
  String? fecha;
  String? recorrido;
  String? horaInicio;
  String? horaLlegada;
  String? destinatario;

  Reporte(
      {this.chapa,
      this.odometro,
      this.fecha,
      this.recorrido,
      this.horaInicio,
      this.horaLlegada,
      this.destinatario});
}

Reporte reporteInicial = Reporte(
  chapa: "",
  odometro: "",
  fecha: "",
  recorrido: "",
  horaInicio: "",
  horaLlegada: "",
  destinatario: "",
);
