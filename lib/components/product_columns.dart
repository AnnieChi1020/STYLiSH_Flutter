import 'package:flutter/material.dart';
import 'package:flutter_stylish/components/product_card.dart';
import 'package:flutter_stylish/main.dart';

class ProductColumns extends StatelessWidget {
  const ProductColumns({
    super.key,
    required this.items,
    required this.category,
  });

  final List<Product> items;
  final String category;

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(category),
      ),
      Expanded(
          child: CustomScrollView(
        center: centerKey,
        slivers: <Widget>[
          SliverList(
            key: centerKey,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ProductCard(
                    name: items[index].name, price: items[index].price);
              },
              childCount: items.length,
            ),
          ),
        ],
      ))
    ]);
  }
}
