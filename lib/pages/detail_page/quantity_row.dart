
import 'package:flutter/material.dart';

class QuantityRow extends StatefulWidget {
  @override
  _QuantityRowState createState() => _QuantityRowState();
}

class _QuantityRowState extends State<QuantityRow> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('數量'),
        const SizedBox(width: 12),
        TextButton(
          onPressed: () {
            setState(() {
              _quantity = _quantity > 1 ? _quantity - 1 : 1;
            });
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.black, // 設置背景色為黑色
            textStyle: const TextStyle(color: Colors.white), // 設置文本顏色為白色
          ),
          child: const Text('-'),
        ),
        const SizedBox(width: 20),
        Text(_quantity.toString()),
        const SizedBox(width: 20),
        TextButton(
          onPressed: () {
            setState(() {
              _quantity++;
            });
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.black, // 設置背景色為黑色
            textStyle: const TextStyle(color: Colors.white), // 設置文本顏色為白色
          ),
          child: const Text('+'),
        ),
      ],
    );
  }
}
