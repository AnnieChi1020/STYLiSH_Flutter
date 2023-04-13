import 'package:flutter/material.dart';
import 'package:flutter_stylish/pages/detail_page/selector_panel.dart/main.dart';

class RightDetail extends StatelessWidget {
  final List<Map<String, String>> colors = [
    {"code": "FFFFFF", "name": "白色"},
    {"code": "DDFFBB", "name": "亮綠"},
    {"code": "CCCCCC", "name": "淺灰"}
  ];
  final List<String> sizes = [
    'S',
    'M',
    'L',
  ];

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
      const SizedBox(height: 12.0),
      Divider(
        color: Colors.grey.shade500,
        height: 12,
        thickness: 0.5,
        indent: 0,
        endIndent: 0,
      ),
      SelectorPanel(colors: colors, sizes: sizes),
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
