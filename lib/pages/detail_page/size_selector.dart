import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({Key? key}) : super(key: key);

  @override
  _SizeSelectorState createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  String _selectedSize = 'M';

  void _selectSize(String size) {
    setState(() {
      _selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('尺寸'),
        const SizedBox(width: 16.0),
        InkWell(
          onTap: () => _selectSize('S'),
          child: Container(
            width: 32.0,
            height: 32.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                'S',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        InkWell(
          onTap: () => _selectSize('M'),
          child: Container(
            width: 32.0,
            height: 32.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                'M',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        InkWell(
          onTap: () => _selectSize('L'),
          child: Container(
            width: 32.0,
            height: 32.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                'L',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
