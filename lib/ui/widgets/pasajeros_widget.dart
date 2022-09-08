import 'package:flutter/material.dart';

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
        children: [
          Text("Seleccione los pasajeros:",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text("Especialistas", style: TextStyle(fontSize: 16)),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                    onPressed: () {},
                    child: Text("Torreros", style: TextStyle(fontSize: 16))),
              ),
            ],
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [

                    Icon(Icons.check_box_outlined),
                    Text("1"),
                    Icon(Icons.check_box_outlined),
                    Text("A"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.check_box_outlined),
                    Text("2"),
                    Icon(Icons.check_box_outlined),
                    Text("A"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.check_box_outlined),
                    Text("3"),
                    Icon(Icons.check_box_outlined),
                    Text("A"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.check_box_outlined),
                    Text("4"),
                    Icon(Icons.check_box_outlined),
                    Text("A"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.check_box_outlined),
                    Text("5"),
                    Icon(Icons.check_box_outlined),
                    Text("A"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
