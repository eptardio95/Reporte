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

class Telefonos {
  String? telefonoEduardito;
  String? telefonoMarlon;
  String? telefonoAsmel;
  String? telefonoYosbel;

  Telefonos(
      {this.telefonoEduardito = "+5352886390",
      this.telefonoMarlon = "+5352884868",
      this.telefonoAsmel = "+5352886388",
      this.telefonoYosbel = "+5352884444"});
}


