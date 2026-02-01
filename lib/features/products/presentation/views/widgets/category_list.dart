import 'package:e_commerce_app/features/products/data/models/category_model.dart';
import 'package:e_commerce_app/features/products/presentation/manager/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final List<CategoryModel> categories = [
    CategoryModel(title: 'All', icon: Icons.category),
    CategoryModel(title: 'electronics', icon: Icons.device_unknown),
    CategoryModel(title: 'jewelery', icon: Icons.diamond),
    CategoryModel(title: 'men\'s clothing', icon: Icons.male),
    CategoryModel(title: 'women\'s clothing', icon: Icons.female),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          5,
          (index) => Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: GestureDetector(
              onTap: () {
                if (categories[index].title == 'All') {
                  BlocProvider.of<ProductsCubit>(context).getAllProducts();
                } else {
                  BlocProvider.of<ProductsCubit>(
                    context,
                  ).getProductsByCategory(category: categories[index].title);
                }
                setState(() {
                  currentIndex = index;
                });
              },
              child: CategoryItem(
                categoryModel: categories[index],
                isSelected: currentIndex == index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
