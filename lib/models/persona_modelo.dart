import 'package:flutter/material.dart';


class PersonaModelo {
  IconData? iconoIzquierda;
  IconData? iconoDerecha;
  String? nombre;
  String? descripcion;
  String? nickname;
  String? telefono;

  PersonaModelo(
      {this.descripcion,
      this.iconoDerecha,
      this.iconoIzquierda,
      this.nombre,
      this.nickname,
      this.telefono});
}

/// Instancio la clases pero fuera de su declaracion. Asi puede ser accesible
/// desde cualquier otro archivo mientras que lo importe

PersonaModelo persona1 = PersonaModelo(
    nombre: "Edua",
    descripcion: "Curso Flutter",
    iconoIzquierda: Icons.person,
    iconoDerecha: Icons.message,
    nickname: "ScarZeek",
    telefono: "+53 54478623");

PersonaModelo persona2 = PersonaModelo(
    nombre: "Malon",
    descripcion: "Curso Flutter",
    iconoIzquierda: Icons.person,
    iconoDerecha: Icons.message,
    nickname: "ASAO",
    telefono: "+53 54649932");

PersonaModelo persona3 = PersonaModelo(
    nombre: "Edua",
    descripcion: "Curso Flutter",
    iconoIzquierda: Icons.person,
    iconoDerecha: Icons.message,
    nickname: "ScarZeek",
    telefono: "+53 54478623");
