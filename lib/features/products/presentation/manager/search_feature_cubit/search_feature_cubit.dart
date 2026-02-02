import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/data/repos/product_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_feature_state.dart';

class SearchFeatureCubit extends Cubit<SearchFeatureState> {
  final ProductRepo productRepo;
  double minimumPrice = 16;
  double maximumPrice = 350;
  String query = '';
  String? category;
  SearchFeatureCubit(this.productRepo) : super(SearchFeatureInitial());
  Future<void> searchProducts({
    required String query,
    required String? category,
    required double minmumPrice,
    required double maximumPrice,
  }) async {
    emit(SearchFeatureLoading());
    final result = await productRepo.searchProducts(
      query: query,
      category: category,
      minmumPrice: minmumPrice,
      maximumPrice: maximumPrice,
    );
    result.fold(
      (failure) {
        emit(SearchFeatureError(message: failure.message));
      },
      (products) {
        emit(SearchFeatureLoaded(products: products));
      },
    );
  }

  void changePrice({
    required double minmumPrice,
    required double maximumPrice,
  }) {
    minimumPrice = minmumPrice;
    this.maximumPrice = maximumPrice;
  }

  void changeQuery({required String query}) async {
    this.query = query;
    await searchProducts(
      query: this.query,
      category: category,
      minmumPrice: minimumPrice,
      maximumPrice: maximumPrice,
    );
  }

  void addCategory({required String category}) {
    if (this.category == null) {
      this.category = category;
    } else {
      List<String> categories = this.category!.split(',');
      if (categories.contains(category)) {
        return;
      }
      this.category = "${this.category},$category";
    }
  }

  void removeCategory({required String category}) {
    if (this.category != null) {
      List<String> categories = this.category!.split(',');
      categories.remove(category);
      this.category = categories.isNotEmpty ? categories.join(',') : null;
    }
  }
}
