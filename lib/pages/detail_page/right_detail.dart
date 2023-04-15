import 'package:flutter/material.dart';
import 'package:flutter_stylish/models/product.dart';
import 'package:flutter_stylish/pages/detail_page/selector_panel.dart/main.dart';

class RightDetail extends StatelessWidget {
  const RightDetail({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        product.title,
        style: const TextStyle(fontSize: 18.0),
        textAlign: TextAlign.left,
      ),
      const SizedBox(height: 8.0),
      Text(
        product.id.toString(),
        style: const TextStyle(fontSize: 12.0),
        textAlign: TextAlign.left,
      ),
      const SizedBox(height: 16.0),
      Text(
        'NT ${product.price}',
        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
      SelectorPanel(colors: product.colors, sizes: product.sizes),
      const SizedBox(height: 20.0),
      Text(
        product.note,
        style: const TextStyle(
          fontSize: 16.0,
        ),
      ),
      Text(
        product.texture,
        style: const TextStyle(
          fontSize: 16.0,
        ),
      ),
      Text(
        product.place,
        style: const TextStyle(
          fontSize: 16.0,
        ),
      ),
      Text(
        product.wash,
        style: const TextStyle(
          fontSize: 16.0,
        ),
      ),
    ]);
  }
}
