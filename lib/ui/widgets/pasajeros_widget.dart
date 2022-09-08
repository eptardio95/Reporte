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
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).primaryColor)),
      padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pasajeros:",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_add_sharp, size: 30),
                      SizedBox(width: 8.0),
                      Text("Seleccione los pasajeros", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          ListViewBuilderExample(),

          ],
      ),

    );
  }
}
