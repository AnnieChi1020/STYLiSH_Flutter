import 'package:flutter/material.dart';
import 'package:flutter_stylish/components/pages/color_selector.dart';
import 'package:flutter_stylish/components/pages/quantity_row.dart';
import 'package:flutter_stylish/components/pages/size_selector.dart';
import 'package:flutter_stylish/components/responsive_widget.dart';

class RightDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        'Uniqlo 特級輕羽絨',
        style: TextStyle(fontSize: 18.0),
        textAlign: TextAlign.left,
      ),
      const SizedBox(height: 8.0),
      const Text(
        '202312321',
        style: TextStyle(fontSize: 12.0),
        textAlign: TextAlign.left,
      ),
      const SizedBox(height: 16.0),
      const Text(
        'NT 100',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      const SizedBox(height: 24.0),
      const ColorSelector(),
      const SizedBox(height: 12.0),
      const SizeSelector(),
      const SizedBox(height: 12.0),
      QuantityRow(),
      const SizedBox(height: 20.0),
      ResponsiveWidget(
        smallScreenComponent: SizedBox(
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
            child: const Text('請選擇尺寸'),
          ),
        ),
        largeScreenComponent: SizedBox(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              textStyle: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            child: const Text('請選擇尺寸'),
          ),
        ),
      ),
      const SizedBox(height: 20.0),
      const Text(
        '實品顏色一單品照為主',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      const Text(
        '棉 100%',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      const Text(
        '厚薄：薄',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      const Text(
        '彈性：無',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      const Text(
        '素材產地 / 日本',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      const Text(
        '加工產地 / 中國',
        style: TextStyle(
          fontSize: 16.0,
        ),
      )
    ]);
  }
}
