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
  String? telefonoMarlon = "+5352884868";
  String? telefonoAsmel = "+5352886388";
  String? telefonoYosbel = "+5352884444";

  Telefonos(
      {this.telefonoEduardito = "+5352886390",
      this.telefonoMarlon,
      this.telefonoAsmel,
      this.telefonoYosbel});
}
