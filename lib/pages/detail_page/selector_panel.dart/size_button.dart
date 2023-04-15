import 'package:flutter/material.dart';

class SizeButton extends StatefulWidget {
  const SizeButton(
      {Key? key,
      required this.size,
      required this.selected,
      required this.onTap})
      : super(key: key);

  final String size;
  final bool selected;
  final Function onTap;

  @override
  _SizeButtonState createState() => _SizeButtonState();
}

class _SizeButtonState extends State<SizeButton> {
  @override
  Widget build(BuildContext context) {
    String size = widget.size;
    bool selected = widget.selected;
    Function onTap = widget.onTap;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: InkWell(
            onTap: () => {onTap()},
            child: Container(
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? Colors.black : Colors.grey.shade200,
                ),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      size,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: selected ? Colors.white : Colors.black,
                      ),
                    )))));
  }
}
