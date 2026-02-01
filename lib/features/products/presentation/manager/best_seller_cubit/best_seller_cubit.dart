import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/data/repos/product_repo.dart';
import 'package:equatable/equatable.dart';

part 'best_seller_cubit_state.dart';

class BestSellerCubit extends Cubit<BestSellerCubitState> {
  final ProductRepo productRepo;
  BestSellerCubit(this.productRepo) : super(BestSellerCubitInitial());

  Future<void> getBestSellers() async {
    emit(BestSellerCubitLoading());
    final result = await productRepo.getBestSellers();
    result.fold(
      (failure) {
        emit(BestSellerCubitError(message: failure.message));
      },
      (products) {
        emit(BestSellerCubitLoaded(products: products));
      },
    );
  }
}
