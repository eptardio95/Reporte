import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inicial/controllers/lista_contactos_controller.dart';
import 'package:inicial/models/persona_modelo.dart';


GlobalKey<FormState> formContactoKey = GlobalKey<FormState>();
GlobalKey<ScaffoldState> formPageKey = GlobalKey<ScaffoldState>();

class FormContactoPage extends StatefulWidget {

  final String? title;

  FormContactoPageArguments arg;

  FormContactoPage({Key? key, required this.arg, this.title}) : super(key: key);

  @override
  State<FormContactoPage> createState() => _FormContactoPageState();
}

class _FormContactoPageState extends State<FormContactoPage> {
  late TextEditingController _nombreController;
  late TextEditingController _nickNameController;
  late TextEditingController _telefonoController;

  final ListaContactosController listaController =
      ListaContactosController.instancia;
  final PersonaModelo _persona = PersonaModelo();

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: "");
    _nickNameController = TextEditingController(text: "");
    _telefonoController = TextEditingController(text: "");
  }

  bool validateAll() {
    if (formContactoKey.currentState!.validate()) {
      return true;
    } else {
      formPageKey.currentState?.showSnackBar(
          const SnackBar(content: const Text('Inserte todos los datos necesarios')));
      return false;
    }
  }
/// Funcion para validar si los textformfield
  String? validate(String value, String key) =>
      value.isEmpty ? "Inserte su ${key}" : null;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: listaController.contactos,
        builder: (context, value, child) {
          return Scaffold(
              key: formPageKey,
              appBar: AppBar(
                /// Esto es para que no aparezca el boton leading de ir atras por defecto
                //automaticallyImplyLeading: true,
                centerTitle: true,
                title: Text(widget.title!,
                ),
              ),
              body: SingleChildScrollView(
                child: Form(
                  key: formContactoKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          inputFormatters: [FilteringTextInputFormatter(RegExp("[A-Z a-z]"),allow: true)],
                          validator: (value) => validate(value!, "nombre"),
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              suffixIcon: const Icon(Icons.abc),
                              labelText: 'Nombre',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor))),
                          onChanged: (value) {
                            _persona.nombre = value;
                          },

                          // onChanged: (value) => print(_nombreController.text),
                          controller: _nombreController,
                        ),
                        const SizedBox(height: 8.0),
                        Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8.0),
                            // border:
                            //   Border.all(color: Theme.of(context).primaryColor)
                          ),
                          child: TextFormField(
                            validator: (value) => validate(value!, "nickname"),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person_pin),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                labelText: 'NickName',
                                hintText: 'NickName'),
                            onChanged: (value) => _persona.nickname = value,

                            // onChanged: (value) => print(_nickNameController.text),
                            controller: _nickNameController,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          ///Solo permite escribir numeros y no letras
                          // inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                          ///Permite filtrar con RegExp los caracteres que deseas ingresar
                          inputFormatters: [FilteringTextInputFormatter(RegExp("[0-9]"),allow: true)],
                          maxLength: 8,
                          ///Tipos de teclado
                          keyboardType: TextInputType.number,

                          validator: (value) => validate(value!, "telefono"),
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.call,
                              ),
                              labelText: 'Telefono',
                              hintText: '+53 54478623',
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.3))),
                          onChanged: (value) => _persona.telefono = value,

                          // onChanged: (value) => print(_telefonoController.text),
                          controller: _telefonoController,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          // color: Theme.of(context).primaryColor,
                          onPressed: () {
                            if (validateAll()) {
                              listaController.contactos.value =
                                  List.from(listaController.contactos.value)
                                    ..add(_persona);
                            Navigator.pop(context);
                            }

                            _persona.iconoIzquierda = Icons.person;
                            _persona.iconoDerecha = Icons.message;
                          },
                          child: const Text(
                            "Agregar contacto",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )

              // Center(
              //   child: RaisedButton(
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //       // Navigator.pop(context);   Hace lo mismo
              //     },
              //     child: Text(arg.text),
              //   ),
              // ),
              );
        });
  }
  @override
  void dispose() {
    _nombreController.dispose();
    _nickNameController.dispose();
    _telefonoController.dispose();
    super.dispose();
  }
}

class FormContactoPageArguments {
  final String text;

  FormContactoPageArguments({required this.text});
}
