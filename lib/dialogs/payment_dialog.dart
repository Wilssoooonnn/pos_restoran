import 'package:flutter/material.dart';

class PaymentDialog extends StatefulWidget {
  final double total;

  const PaymentDialog({super.key, required this.total});

  @override
  State<PaymentDialog> createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  String method = "cash";
  final TextEditingController codeCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Payment",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            Text("Total: Rp ${widget.total.toStringAsFixed(0)}",
                style:
                const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

            const SizedBox(height: 20),

            // PAYMENT METHODS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                methodButton("cash", "Cash"),
                methodButton("transfer", "Transfer"),
                methodButton("qris", "QRIS"),
              ],
            ),

            const SizedBox(height: 20),

            TextField(
              controller: codeCtrl,
              decoration: const InputDecoration(
                labelText: "Kode Pembayaran (optional)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, {
                    "method": method,
                    "code": codeCtrl.text,
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child:
                const Text("Bayar Sekarang", style: TextStyle(fontSize: 18)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget methodButton(String value, String label) {
    final bool selected = method == value;
    return ElevatedButton(
      onPressed: () => setState(() => method = value),
      style: ElevatedButton.styleFrom(
        backgroundColor: selected ? Colors.blue : Colors.grey[300],
        foregroundColor: selected ? Colors.white : Colors.black,
      ),
      child: Text(label),
    );
  }
}
