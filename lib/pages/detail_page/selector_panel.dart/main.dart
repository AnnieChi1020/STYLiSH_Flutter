import 'package:flutter/material.dart';
import './color_selector.dart';
import './quantity_selector.dart';
import './size_selector.dart';

class SelectorPanel extends StatefulWidget {
  const SelectorPanel({Key? key, required this.colors, required this.sizes})
      : super(key: key);

  final List<Map<String, String>> colors;
  final List<String> sizes;

  @override
  _SelectorPanelState createState() => _SelectorPanelState();
}

class _SelectorPanelState extends State<SelectorPanel> {
  String selectedColorCode = '';
  String selectedSize = '';

  void setSelectColor(String code) {
    setState(() {
      selectedColorCode = code;
    });
  }

  void setSelectSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 24.0),
      ColorSelector(
          colors: widget.colors,
          selectedColor: selectedColorCode,
          setSelectColor: setSelectColor),
      const SizedBox(height: 16.0),
      SizeSelector(
          sizes: widget.sizes,
          selectedSize: selectedSize,
          setSelectSize: setSelectSize),
      const SizedBox(height: 16.0),
      QuantitySelector(),
      const SizedBox(height: 24.0),
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            textStyle: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('請選擇尺寸'),
          ),
        ),
      )
    ]);
  }
}
