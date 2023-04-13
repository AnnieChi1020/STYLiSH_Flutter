import 'package:flutter/material.dart';
import 'package:flutter_stylish/components/responsive_widget.dart';
import 'package:flutter_stylish/pages/detail_page/right_detail.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
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
                                      Image.asset(
                                        'assets/images/image1.jpeg',
                                      ),
                                      const SizedBox(height: 16.0),
                                      RightDetail(),
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
                                        child: Image.asset(
                                          'assets/images/image1.jpeg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 20.0),
                                      Expanded(child: RightDetail()),
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
                                Image.asset('assets/images/image1.jpeg'),
                                const SizedBox(height: 12.0),
                                Image.asset('assets/images/image1.jpeg'),
                                const SizedBox(height: 12.0),
                                Image.asset('assets/images/image1.jpeg'),
                                const SizedBox(height: 12.0),
                                Image.asset('assets/images/image1.jpeg'),
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
