import 'package:flutter/material.dart';
import 'package:flutter_stylish/components/product_card.dart';
import 'package:flutter_stylish/components/product_column_desktop.dart';
import 'package:flutter_stylish/components/product_column_mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STYLiSH',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'STYLiSH'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Product {
  final String name;
  final String price;

  Product({required this.name, required this.price});
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Product> items = [
    Product(name: 'UNIQLO 特級輕羽絨', price: '100'),
    Product(name: 'UNIQLO 特級輕羽絨', price: '100'),
    Product(name: 'UNIQLO 特級輕羽絨', price: '100'),
    Product(name: 'UNIQLO 特級輕羽絨', price: '100')
  ];

  final List<String> categories = ['女裝', '男裝', '配件'];

  final List<String> bannerImages = [
    'assets/images/image1.jpeg',
    'assets/images/image1.jpeg',
    'assets/images/image1.jpeg',
    'assets/images/image1.jpeg',
    'assets/images/image1.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/stylish_logo.png',
          width: 150.0,
        ),
        backgroundColor: Colors.grey[100],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: SizedBox(
                height: 150.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bannerImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            bannerImages[index],
                            width: 360,
                            fit: BoxFit.cover,
                          ),
                        ));
                  },
                )),
          ),
          Expanded(
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              final screenWidth = constraints.maxWidth;
              final isDesktop = screenWidth > 600;

              if (isDesktop) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ProductColumnDesktop(
                          items: items, category: categories[0]),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ProductColumnDesktop(
                          items: items, category: categories[1]),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ProductColumnDesktop(
                          items: items, category: categories[2]),
                    )),
                  ],
                );
              } else {
                return Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView(children: [
                        ProductColumnMobile(
                            items: items, category: categories[0]),
                        ProductColumnMobile(
                            items: items, category: categories[1]),
                        ProductColumnMobile(
                            items: items, category: categories[2]),
                      ])),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
