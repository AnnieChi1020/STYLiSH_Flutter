import 'package:flutter/material.dart';
import 'package:flutter_stylish/pages/detail_page/selector_panel.dart/quantity_button.dart';

class QuantitySelector extends StatefulWidget {
  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int _quantity = 1;

  void increment() {
    setState(() {
      _quantity++;
    });
  }

  void decrement() {
    if (_quantity == 1) return;

    setState(() {
      _quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30.0,
        child: Row(
          children: [
            const Text('數量'),
            const SizedBox(width: 12.0),
            VerticalDivider(width: 1.0, color: Colors.grey.shade400),
            const SizedBox(width: 16.0),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QuantityButton(label: '-', onTap: decrement),
                const SizedBox(width: 20),
                Text(_quantity.toString()),
                const SizedBox(width: 20),
                QuantityButton(label: '+', onTap: increment),
              ],
            ))
          ],
        ));
  }
}
