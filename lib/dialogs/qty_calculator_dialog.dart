import 'package:flutter/material.dart';

class QtyCalculatorDialog extends StatefulWidget {
  final int initialQty;

  const QtyCalculatorDialog({super.key, required this.initialQty});

  @override
  State<QtyCalculatorDialog> createState() => _QtyCalculatorDialogState();
}

class _QtyCalculatorDialogState extends State<QtyCalculatorDialog> {
  late int qty;

  @override
  void initState() {
    super.initState();
    qty = widget.initialQty;
  }

  Widget numButton(String number) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              qty = int.tryParse("$qty$number") ?? qty;
            });
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 18),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          child: Text(number, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Edit Quantity",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            Text("Qty: $qty",
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),

            const SizedBox(height: 20),

            // KEYPAD
            Column(
              children: [
                Row(children: [numButton("1"), numButton("2"), numButton("3")]),
                Row(children: [numButton("4"), numButton("5"), numButton("6")]),
                Row(children: [numButton("7"), numButton("8"), numButton("9")]),
                Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: ElevatedButton(
                        onPressed: () => setState(() => qty = 0),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent),
                        child: const Text("C"),
                      ),
                    ),
                  ),
                  numButton("0"),
                  Expanded(child: Container()),
                ]),
              ],
            ),

            const SizedBox(height: 15),

            // OK button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, qty),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("OK", style: TextStyle(fontSize: 18)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
