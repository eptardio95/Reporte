import 'package:flutter/material.dart';
import 'package:inicial/models/persona_modelo.dart';
import 'package:inicial/ui/pages/detalles_contacto_page.dart';
import 'package:url_launcher/url_launcher.dart';

const IconData whatsAppIcon = IconData(0xea93, fontFamily: 'CustomIcon');

class CustomListTile extends StatelessWidget {
  final PersonaModelo? person;



  CustomListTile({this.person});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, 'detalle_contacto',
            arguments: DetallesContactoPageArguments(
                persona: person, contenido: "Contenido"));

        /// Otra forma
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return DetallesContactoPage(
        //     persona: person,
        //     contenido: person.nombre.contains("Edua") ? "Hello" : "NADA",
        //   );
        // }));
      },
      trailing: SizedBox(
          width: 100.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(whatsAppIcon), onPressed: () {
                  launch("https://wa.me/${person!.telefono}?text=hola");
                  },
              ),
              IconButton(
                icon: Icon(Icons.call), onPressed: () {
                  launch("tel:${person!.telefono}");
                  },
              ),
            ],
          )),
      leading: Icon(person!.iconoIzquierda),
      title: Text(person!.nombre!),
      subtitle: Text(person!.nickname!),
    );
  }
}
