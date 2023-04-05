import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector({Key? key}) : super(key: key);

  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  String _selectedColor = 'M';

  void _selectColor(String color) {
    setState(() {
      _selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('顏色'),
        const SizedBox(width: 16),
        InkWell(
          onTap: () => _selectColor('blue'),
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () => _selectColor('brown'),
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: const BoxDecoration(
              color: Colors.brown,
            ),
          ),
        ),
      ],
    );
  }
}
