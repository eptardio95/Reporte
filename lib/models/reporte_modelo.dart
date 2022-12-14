import 'package:flutter/material.dart';
// import 'package:inicial/controllers/reporte_controller.dart';

import '../controllers/reporte_controller.dart';

class Reporte {
  String? chapa;
  String? odometro;
  String? fecha;
  String? recorrido;
  String? horaInicio;
  String? horaLlegada;
  String? destinatario;
  String? msg;

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
  Map<String, String>? agenda;

  Telefonos(
      {this.agenda = const {
        "Eduardo": "+5352886390",
        "Marlon": "+5352884868",
        "Asmel": "+5352886388",
        "Yosbel": "+5352884444"
      }});
}

class TextEditControllerModelo {
  TextEditingController? odometroController;

  TextEditControllerModelo({this.odometroController});
}

class Pasajeros {
  List<String>? pasajerosList;
  List<String>? pasajerosListAbreviados;
  String? pasajerosMsg;

  Pasajeros(
      {this.pasajerosList = const [
        "Yosbel Sosa",
        "Eduardo Perez",
        "Marlon Morales",
        "Eduardo Hernandez",
        "Leopoldo Lage",
        "Asmel Lucena",
        "Angel Santiago",
        "Yosvel Camejo",
        "Jose Cubilla",
        "Norelvis",
      ],
      this.pasajerosMsg,
      this.pasajerosListAbreviados = const [
          "Y.Sosa",
          "E.Perez T",
          "Marlon",
          "E.Hdez C",
          "Lage",
          "Asmel",
          "A.Santiago",
          "Y.Camejo",
          "J.Cubilla",
          "Norelvis",
        ]
      });
}

class CheckBoxListModelo {
  List<bool>? checkBoxList;

  CheckBoxListModelo(
      {this.checkBoxList});
}

