import 'package:flutter/material.dart';
import 'package:inicial/controllers/main_controller.dart';
import 'package:inicial/controllers/theme_controller.dart';
import 'package:inicial/ui/pages/form_contact_page.dart';


class CustomButton extends StatelessWidget {
  ValueNotifier<String> titulo = ValueNotifier<String>("Agregar contactoss");
  ThemeController _controller = ThemeController.instancia;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          _controller.changeTheme(false);
          presionandoBoton();

          Navigator.pushNamed(context, 'form_contacto',
              arguments: FormContactoPageArguments(text: "ATRAS"));

          /// Esta es una forma
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return FormContactoPage();

          /// Esta es otra forma
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //   return FormContactoPage();
        },
        child: ValueListenableBuilder(
          valueListenable: titulo,
          builder: (context, value, child) {
            return Container(
                height: 60.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(8.0)),
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    titulo.value,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20.0,
                        fontFamily: 'Parakan Brush'

                        // style: GoogleFonts.aBeeZee(color: Theme.of(context).primaryColor, fontSize: 25.0
                        // )
                        ),

                    //   style: TextStyle(
                    //       color: Theme.of(context).primaryColor, fontSize: 20.0),
                    // ),
                  ),
                ));
          },
        ));
  }
}
