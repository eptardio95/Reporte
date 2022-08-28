import 'package:flutter/material.dart';
import 'package:inicial/controllers/lista_contactos_controller.dart';
import 'package:inicial/models/persona_modelo.dart';
import 'package:inicial/ui/pages/home_page.dart';
import 'package:inicial/ui/widgets/custom_button.dart';
import 'package:inicial/ui/widgets/custom_listtile.dart';


class ListaContactosPage extends StatelessWidget {

  ListaContactosController listaController = ListaContactosController.instancia;

  ListaContactosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<PersonaModelo>>(
        valueListenable: listaController.contactos,
        builder: (context, value, child){
          return Column(
            children: <Widget>[
              CustomButton(),
              Expanded(
                child: ListView.builder(
                  itemCount: listaController.contactos.value.length,

                  /// picker es como el iterador que va a tomar el valor del elemento seleccionado
                  itemBuilder: (context, picker) {

                    return Dismissible(
                        background: Container(color: Colors.red),
                        onDismissed: (direction) => listaController.contactos.value.removeAt(picker),
                        key: Key(picker.toString()),
                        child: CustomListTile(person: listaController.contactos.value[picker]));
                  },
                ),
              )
            ],
          );
        });
  }
}
