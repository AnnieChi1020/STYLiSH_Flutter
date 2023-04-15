import 'package:flutter/material.dart';

class ColorButton extends StatefulWidget {
  const ColorButton(
      {Key? key,
      required this.code,
      required this.selected,
      required this.onTap})
      : super(key: key);

  final String code;
  final bool selected;
  final Function onTap;

  @override
  _ColorButtonState createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  @override
  Widget build(BuildContext context) {
    String colorCode = widget.code;
    Color color = Color(int.parse('0xFF$colorCode'));
    bool selected = widget.selected;
    Function onTap = widget.onTap;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: InkWell(
            onTap: () => {
                  onTap(),
                },
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1.0,
                    color: selected ? Colors.black : Colors.grey.shade200),
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                    ),
                  )),
            )));
  }
}
