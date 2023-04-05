import 'package:flutter/material.dart';
import 'package:flutter_stylish/pages/main_page/product_card.dart';
import 'package:flutter_stylish/main.dart';

class ProductColumnMobile extends StatefulWidget {
  const ProductColumnMobile({
    Key? key,
    required this.items,
    required this.category,
  }) : super(key: key);

  final List<Product> items;
  final String category;

  @override
  _ProductColumnMobileState createState() => _ProductColumnMobileState();
}

class _ProductColumnMobileState extends State<ProductColumnMobile> {
  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(
            child: TextButton(
          child: Text(widget.category),
          onPressed: () {
            setState(() {
              isShow = !isShow;
            });
          },
        )),
      ),
      Visibility(
        visible: isShow,
        child: Column(
          children: widget.items
              .map((product) => ProductCard(
                    name: product.name,
                    price: product.price,
                  ))
              .toList(),
        ),
      )
    ]);
  }
}
