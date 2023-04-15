import 'package:bloc/bloc.dart';
import 'package:flutter_stylish/models/product.dart';
import 'package:flutter_stylish/services/product_service.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductService productService;

  ProductCubit({required this.productService}) : super(ProductInitial());

  Future<void> fetchProducts() async {
    try {
      emit(ProductLoading());
      final List products = await productService.getProducts('all');

      final List womenProducts = [];
      womenProducts.addAll(products);
      womenProducts.retainWhere((element) => element.category == 'women');

      final List menProducts = [];
      menProducts.addAll(products);
      menProducts.retainWhere((element) => element.category == 'men');

      final List accessoryProducts = [];
      accessoryProducts.addAll(products);
      accessoryProducts
          .retainWhere((element) => element.category == 'accessories');

      emit(ProductLoaded({
        'women': womenProducts,
        'men': menProducts,
        'accessory': accessoryProducts
      }));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
