import 'package:flutter/material.dart';

class SelectionButton extends StatelessWidget {
  String selection;
  SelectionButton(this.selection);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(12),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 1, 87, 207)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
                  )),

                ),
                onPressed: (){},
                child: Text(selection, style: TextStyle(
                    fontSize: 20
                ),)
            ),
          ),
        ),
      ],
    );
  }
}