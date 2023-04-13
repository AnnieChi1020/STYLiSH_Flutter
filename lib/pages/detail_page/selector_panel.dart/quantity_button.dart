import 'package:flutter/material.dart';

class QuantityButton extends StatefulWidget {
  const QuantityButton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  final String label;
  final Function onTap;

  @override
  _QuantityButtonState createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  @override
  Widget build(BuildContext context) {
    String label = widget.label;
    Function onTap = widget.onTap;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: InkWell(
            onTap: () => {onTap()},
            child: Container(
                width: 24.0,
                height: 24.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    )))));
  }
}
