import 'package:flutter/material.dart';
import 'package:inicial/models/persona_modelo.dart';



class ListaContactosController {

  static List<PersonaModelo> persons = [
    persona1,
    persona2,
    persona3,
    persona1,
  ];

  static final ListaContactosController instancia = ListaContactosController._();

  ListaContactosController._();

  ValueNotifier <List<PersonaModelo>> contactos = ValueNotifier<List<PersonaModelo>>(persons);
}