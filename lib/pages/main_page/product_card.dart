import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  final String name;
  final int price;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details');
      },
      child: Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 80.0,
                  height: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: 'https://cors-anywhere.herokuapp.com/' + imageUrl,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name),
                        Text(price.toString()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
