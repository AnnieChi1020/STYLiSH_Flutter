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
      final List products = await productService.getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
