import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/data/repos/product_repo.dart';
import 'package:equatable/equatable.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  final ProductRepo productRepo;
  AllProductsCubit(this.productRepo) : super(AllProductsInitial());

  Future<void> getTopRated() async {
    emit(AllProductsLoading());
    final result = await productRepo.getTopRated();
    result.fold(
      (failure) {
        emit(AllProductsError(message: failure.message));
      },
      (products) {
        emit(AllProductsLoaded(productsList: products));
      },
    );
  }
}
