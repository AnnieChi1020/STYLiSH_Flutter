import 'package:flutter_stylish/models/product.dart';
import 'package:dio/dio.dart';

final dio = Dio();

class ProductService {
  Future<List<Product>> getAllProducts(String category) async {
    List<Product> products = [];

    getProducts(int paging) async {
      String url = 'https:/api.appworks-school.tw/api/1.0/products/$category';

      if (paging != null) {
        url = url + '?paging=$paging';
      }

      final response = await dio.get(
        url,
        queryParameters: {
          'paging': paging,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> resProducts = response.data['data'];

        List<Product> _products =
            resProducts.map((json) => Product.fromJson(json)).toList();
        products = [products, _products].expand((x) => x).toList();

        if (response.data['next_paging'] != null) {
          await getProducts(response.data['next_paging']);
        }
      } else {
        throw Exception('Failed to load products');
      }
    }

    await getProducts(0);

    return products;
  }
}
