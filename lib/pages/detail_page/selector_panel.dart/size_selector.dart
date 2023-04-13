import 'package:flutter/material.dart';
import './size_button.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector(
      {Key? key,
      required this.sizes,
      required this.selectedSize,
      required this.setSelectSize})
      : super(key: key);

  final List<String> sizes;
  final String selectedSize;
  final Function setSelectSize;

  @override
  _SizeSelectorState createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30.0,
        child: Row(
          children: [
            const Text('尺寸'),
            const SizedBox(width: 12.0),
            VerticalDivider(width: 1.0, color: Colors.grey.shade400),
            const SizedBox(width: 16.0),
            Expanded(
                child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.sizes.length,
              itemBuilder: (BuildContext context, int index) {
                String size = widget.sizes[index];
                return SizeButton(
                    size: size,
                    selected: size == widget.selectedSize,
                    onTap: () => widget.setSelectSize(size));
              },
            )),
          ],
        ));
  }
}
