import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stylish/cubit/product_cubit.dart';
import 'package:flutter_stylish/pages/detail_page/main.dart';
import 'package:flutter_stylish/pages/main_page/product_column_desktop.dart';
import 'package:flutter_stylish/components/responsive_widget.dart';
import 'package:flutter_stylish/pages/main_page/product_column_mobile.dart';
import 'package:flutter_stylish/services/product_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            ProductCubit(productService: ProductService())..fetchProducts(),
        child: MaterialApp(
          title: 'STYLiSH',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: const MyHomePage(title: 'STYLiSH'),
          routes: {
            '/details': (context) => DetailPage(),
          },
        ));
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
  final List<String> categories = ['女裝', '男裝', '配件'];

  final List<String> bannerImages = [
    'assets/images/image1.jpeg',
    'assets/images/image1.jpeg',
    'assets/images/image1.jpeg',
    'assets/images/image1.jpeg',
    'assets/images/image1.jpeg'
  ];

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchProducts();
  }

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
          BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
            if (state is ProductLoading) {
              return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: Center(
                      child: SizedBox(child: CircularProgressIndicator())));
            }
            if (state is ProductLoaded) {
              return Expanded(
                  child: ResponsiveWidget(
                largeScreenComponent: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ProductColumnDesktop(
                          items: state.products['women'],
                          category: categories[0]),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ProductColumnDesktop(
                          items: state.products['men'],
                          category: categories[1]),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ProductColumnDesktop(
                          items: state.products['accessory'],
                          category: categories[2]),
                    )),
                  ],
                ),
                smallScreenComponent: Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView(children: [
                        ProductColumnMobile(
                            items: state.products['women'],
                            category: categories[0]),
                        ProductColumnMobile(
                            items: state.products['men'],
                            category: categories[1]),
                        ProductColumnMobile(
                            items: state.products['accessory'],
                            category: categories[2]),
                      ])),
                ),
              ));
            } else {
              return const Text('Error');
            }
          }),
        ],
      ),
    );
  }
}
