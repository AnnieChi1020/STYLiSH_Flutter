import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stylish/components/responsive_widget.dart';
import 'package:flutter_stylish/models/product.dart';
import 'package:flutter_stylish/pages/detail_page/right_detail.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.product,
  });

  final Product product;

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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return Align(
                        alignment: Alignment.center,
                        child: Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(
                              maxWidth: 1200.0,
                            ),
                            child: Column(
                              children: [
                                ResponsiveWidget(
                                  smallScreenComponent: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ResponsiveWidget(
                                        smallScreenComponent:
                                            CachedNetworkImage(
                                          imageUrl: product.mainImage,
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          fit: BoxFit.cover,
                                        ),
                                        largeScreenComponent:
                                            CachedNetworkImage(
                                          imageUrl:
                                              'https://cors-anywhere.herokuapp.com/${product.mainImage}',
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 16.0),
                                      RightDetail(product: product),
                                    ],
                                  ),
                                  largeScreenComponent: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 600,
                                        width: 400,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              'https://cors-anywhere.herokuapp.com/${product.mainImage}',
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 20.0),
                                      Expanded(
                                          child: RightDetail(
                                        product: product,
                                      )),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12.0),
                                Row(
                                  children: const [
                                    Text(
                                      '細部說明',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        color: Colors.grey,
                                        height: 20,
                                        thickness: 1,
                                        indent: 8,
                                        endIndent: 8,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12.0),
                                const Text(
                                  'O.N.S is all about options, which is why we took our staple polo shirt and upgraded it with slubby linen jersey',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                ListView.builder(
                                  physics: PageScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: product.images.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: ResponsiveWidget(
                                            largeScreenComponent:
                                                CachedNetworkImage(
                                              imageUrl:
                                                  'https://cors-anywhere.herokuapp.com/${product.images[index]}',
                                              placeholder: (context, url) =>
                                                  const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                              fit: BoxFit.cover,
                                            ),
                                            smallScreenComponent:
                                                CachedNetworkImage(
                                              imageUrl: product.images[index],
                                              placeholder: (context, url) =>
                                                  const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                              fit: BoxFit.cover,
                                            )));
                                  },
                                ),
                              ],
                            )));
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
