import 'package:flutter/material.dart';
import 'package:flutter_stylish/pages/detail_page/selector_panel.dart/color_button.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector(
      {Key? key,
      required this.colors,
      required this.selectedColor,
      required this.setSelectColor})
      : super(key: key);

  final List<Map<String, String>> colors;
  final String selectedColor;
  final Function setSelectColor;

  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30.0,
        child: Row(
          children: [
            const Text('顏色'),
            const SizedBox(width: 12.0),
            VerticalDivider(width: 1.0, color: Colors.grey.shade400),
            const SizedBox(width: 16.0),
            Expanded(
                child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.colors.length,
              itemBuilder: (BuildContext context, int index) {
                String code = widget.colors[index]['code']!;
                return ColorButton(
                    code: code,
                    selected: code == widget.selectedColor,
                    onTap: () => {
                          widget.setSelectColor(code),
                        });
              },
            ))
          ],
        ));
  }
}
