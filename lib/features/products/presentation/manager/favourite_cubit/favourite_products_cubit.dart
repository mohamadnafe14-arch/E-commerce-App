import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/data/repos/product_repo.dart';
import 'package:equatable/equatable.dart';

part 'favourite_products_state.dart';

class FavouriteProductsCubit extends Cubit<FavouriteProductsState> {
  final ProductRepo productRepo;
  FavouriteProductsCubit(this.productRepo) : super(FavouriteProductsInitial());
   List<ProductModel> productsList = [];
  Future<void> getFavouriteProducts() async {
    emit(FavouriteProductsLoading());
    final result = await productRepo.getFavouriteProducts();
    result.fold(
      (failure) {
        emit(FavouriteProductsError(message: failure.message));
      },
      (products) {
        productsList=products;
        emit(FavouriteProductsLoaded(productsList: productsList));
      },
    );
  }
  Future<void> addFavouriteProduct({required ProductModel productModel}) async {
    await productRepo.addFavouriteProduct(productModel: productModel);
    await getFavouriteProducts();
  }

  Future<void> removeFavouriteProduct({required ProductModel productModel}) async {
    await productRepo.removeFavouriteProduct(productModel: productModel);
    await getFavouriteProducts();
  }
  bool isFavourite(ProductModel productModel){
    return productsList.any((element) => element.id==productModel.id);
  }
}
