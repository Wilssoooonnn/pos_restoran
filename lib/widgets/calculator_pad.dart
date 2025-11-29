import 'package:flutter/material.dart';

class CalculatorPad extends StatelessWidget {
  const CalculatorPad({super.key});

  @override
  Widget build(BuildContext context) {
    Widget keyButton(String label, {Color? color}) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18),
              backgroundColor: color ?? Colors.white,
              foregroundColor: Colors.black,
            ),
            child: Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ),
      );
    }

    return Column(
      children: [
        Row(children: [keyButton("1"), keyButton("2"), keyButton("3")]),
        Row(children: [keyButton("4"), keyButton("5"), keyButton("6")]),
        Row(children: [keyButton("7"), keyButton("8"), keyButton("9")]),
        Row(children: [
          keyButton("+/-", color: Colors.yellow[300]),
          keyButton("0"),
          keyButton(".", color: Colors.red[200]),
        ]),
      ],
    );
  }
}
