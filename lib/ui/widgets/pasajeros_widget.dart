import 'package:flutter/material.dart';
import 'package:inicial/ui/widgets/pasajeros_listview_widget.dart';


class PasajerosWidget extends StatefulWidget {
  const PasajerosWidget({Key? key}) : super(key: key);

  @override
  State<PasajerosWidget> createState() => _PasajerosWidgetState();
}

class _PasajerosWidgetState extends State<PasajerosWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor)),
      padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pasajeros:",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 20)),

          PasajerosListViewWidget(),
        ],
      ),
    );
  }
}
