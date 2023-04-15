import 'package:flutter_stylish/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductService {
  Future<List<Product>> getProducts(String category) async {
    List<Product> products = [];

    _getProducts(int paging) async {
      String url = 'https:/api.appworks-school.tw/api/1.0/products/$category';

      if (paging != null) {
        url = url + '?paging=$paging';
      }
      print(url);

      final response = await http.get(Uri.parse(url), headers: {
        'Access-Control-Allow-Origin': '*',
      });

      if (response.statusCode == 200) {
        final List<dynamic> productsJson = json.decode(response.body)['data'];
        List<Product> _products =
            productsJson.map((json) => Product.fromJson(json)).toList();
        products = [products, _products].expand((x) => x).toList();

        if (json.decode(response.body)['next_paging'] != null) {
          await _getProducts(json.decode(response.body)['next_paging']);
        }
      } else {
        throw Exception('Failed to load products');
      }
    }

    await _getProducts(1);

    return products;
  }
}


// [
//         {
//           "id": 5678,
//           "category": "men",
//           "title": "厚實毛呢格子外套",
//           "description": "高抗寒素材選用，保暖也時尚有型",
//           "price": 2200,
//           "texture": "棉、聚脂纖維",
//           "wash": "手洗（水溫40度",
//           "place": "韓國",
//           "note": "實品顏色以單品照為主",
//           "story": "你絕對不能錯過的超值商品",
//           "colors": [
//             {"code": "334455", "name": "深藍"},
//             {"code": "FFFFFF", "name": "白色"}
//           ],
//           "sizes": ["S", "M"],
//           "variants": [
//             {"color_code": "334455", "size": "S", "stock": 5},
//             {"color_code": "334455", "size": "M", "stock": 10},
//             {"color_code": "FFFFFF", "size": "S", "stock": 0},
//             {"color_code": "FFFFFF", "size": "M", "stock": 2}
//           ],
//           "main_image":
//               "https://api.appworks-school.tw/assets/201807201824/main.jpg",
//           "images": [
//             "https://api.appworks-school.tw/assets/201807201824/0.jpg",
//             "https://api.appworks-school.tw/assets/201807201824/1.jpg",
//             "https://api.appworks-school.tw/assets/201807201824/0.jpg",
//             "https://api.appworks-school.tw/assets/201807201824/1.jpg"
//           ],
//         }
//       ]