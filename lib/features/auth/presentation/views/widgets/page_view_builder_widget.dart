import 'package:e_commerce_app/core/constants/assets.dart';
import 'package:e_commerce_app/features/auth/data/models/page_view_model.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/page_view_item.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/widgets.dart';

class PageViewBuilderWidget extends StatelessWidget {
  const PageViewBuilderWidget({super.key, required this.pageController});
  final PageController pageController;
  static const List<PageViewModel> pageViewModels = [
    PageViewModel(
      heading: " Shop smarter, live better",
      image: kFirstPage,
      description:
          "Encourages the user to make smart shopping choices that improve their lifestyle and daily comfort",
    ),
    PageViewModel(
      heading: "Discover deals, enjoy the journey",
      image: kSecondPage,
      description:
          " Highlights that shopping is not only about buying but also about enjoying the process of finding great offers",
    ),
    PageViewModel(
      heading: " Your style, your choice",
      image: kThirdPage,
      description:
          " Motivates the user by emphasizing personal freedom and individuality in choosing products that match their taste",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ExpandablePageView.builder(
      controller: pageController,
      itemBuilder: (context, index) =>
          PageViewItem(pageViewModel: pageViewModels[index]),
      itemCount: 3,
    );
  }
}
