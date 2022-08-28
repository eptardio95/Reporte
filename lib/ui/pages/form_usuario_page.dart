import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inicial/services/shared_preferences_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/file_services.dart';

GlobalKey<ScaffoldState> pageUsuarioKey = GlobalKey<ScaffoldState>();
GlobalKey<FormState> formUsuarioKey = GlobalKey<FormState>();

class FormUsuarioPage extends StatefulWidget {
  FormUsuarioPage({Key? key}) : super(key: key);

  @override
  State<FormUsuarioPage> createState() => _FormUsuarioPageState();
}

class _FormUsuarioPageState extends State<FormUsuarioPage> {
  late TextEditingController _nombreController;
  late TextEditingController _telefonoController;

  late String path;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: "");
    _telefonoController = TextEditingController(text: "");
    path = "";
  }

  bool validateAll() {
    if (formUsuarioKey.currentState!.validate()) {
      return true;
    } else {
      pageUsuarioKey.currentState?.showSnackBar(const SnackBar(
          content: const Text('Inserte todos los datos necesarios')));
      return false;
    }
  }

  /// Funcion para validar si los textformfield
  String? validate(String value, String key) =>
      value.isEmpty ? "Inserte su ${key}" : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: pageUsuarioKey,
        appBar: AppBar(
          /// Esto es para que no aparezca el boton leading de ir atras por defecto
          //automaticallyImplyLeading: true,
          centerTitle: true,
          title: const Text(
            'Nuevo Contacto',
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formUsuarioKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter(RegExp("[A-Z a-z]"),
                          allow: true)
                    ],
                    validator: (value) => validate(value!, "nombre"),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        suffixIcon: const Icon(Icons.abc),
                        labelText: 'Nombre',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor))),
                    onChanged: (value) => {},

                    // onChanged: (value) => print(_nombreController.text),
                    controller: _nombreController,
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    ///Solo permite escribir numeros y no letras
                    // inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                    ///Permite filtrar con RegExp los caracteres que deseas ingresar
                    inputFormatters: [
                      FilteringTextInputFormatter(RegExp("[0-9]"), allow: true)
                    ],
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
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.3))),
                    onChanged: (value) => {},

                    // onChanged: (value) => print(_telefonoController.text),
                    controller: _telefonoController,
                  ),
                  path == ""
                      ? SizedBox()
                      : Container(
                          child: Image.file(
                              File(path)), //File hay q importar de 'dart:io';
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      OutlinedButton(
                          onPressed: () async {
                            String image =
                                await FileService.getImage(camera: true);
                            setState(() {
                              path = image;
                            });
                          },
                          child: Text("Abrir camara")),
                      OutlinedButton(
                          onPressed: () async {
                            //var image = ImagePicker.platform.pickImage(source: ImageSource.gallery);
                            String image = await FileService.getImage();
                            setState(() {
                              path = image;
                            });
                          },
                          child: Text("Abrir galeria")),
                    ],
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    // color: Theme.of(context).primaryColor,
                    onPressed: () {

                      File file = File(path);
                      //file.readAsBytesSync()   convierte una imagen a bytes
                      // imageConvert queda como la imagen en formato base 64
                      String imageConvert = base64Encode(file.readAsBytesSync());

                      SharedPreferencesServices.writeString(key: 'nombre', value: _nombreController.text);
                      SharedPreferencesServices.writeString(key: 'telefono', value: _telefonoController.text);
                      SharedPreferencesServices.writeString(key: 'image', value: imageConvert);

                      print("Se guardo las preferencias");


                      // if (validateAll()) {
                      //   //TODO: cambiar valores del usuario
                      //    }
                    },
                    child: const Text(
                      "Actualizar usuario",
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
  }

  @override
  void dispose(){
    _nombreController.dispose();
    _telefonoController.dispose();
    super.dispose();
  }
}

class FormUsuarioPageArguments {
  final String text;

  FormUsuarioPageArguments({required this.text});
}
