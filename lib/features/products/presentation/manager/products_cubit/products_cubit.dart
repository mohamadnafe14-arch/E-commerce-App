import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/data/repos/product_repo.dart';
import 'package:equatable/equatable.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  final ProductRepo productRepo;
  List<ProductModel> productsList = [];
  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getAllProducts();
    result.fold(
      (failure) {
        emit(ProductsError(message: failure.message));
      },
      (products) {
        productsList = products;
        emit(ProductsLoaded(productsList: productsList));
      },
    );
  }

  Future<void> getProductsByCategory({required String category}) async {
    emit(ProductsLoading());
    final result = await productRepo.getProductsByCategory(category: category);
    result.fold(
      (failure) {
        emit(ProductsError(message: failure.message));
      },
      (products) {
        productsList = products;
        emit(ProductsLoaded(productsList: productsList));
      },
    );
  }



  Future<void> getProductById({required String id}) async {
    emit(ProductsLoading());
    final result = await productRepo.getProductById(id: id);
    result.fold(
      (failure) {
        emit(ProductsError(message: failure.message));
      },
      (product) {
        emit(ProductsLoaded(productsList: [product]));
      },
    );
  }

 


}
