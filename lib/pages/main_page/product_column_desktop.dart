import 'package:flutter/material.dart';
import 'package:flutter_stylish/main.dart';
import 'package:flutter_stylish/pages/main_page/product_card.dart';

class ProductColumnDesktop extends StatelessWidget {
  const ProductColumnDesktop({
    super.key,
    required this.items,
    required this.category,
  });

  final List items;
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
                  name: items[index].title,
                  price: items[index].price,
                  imageUrl: items[index].mainImage,
                );
              },
              childCount: items.length,
            ),
          ),
        ],
      ))
    ]);
  }
}
