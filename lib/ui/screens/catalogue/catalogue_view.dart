import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:stacked/stacked.dart';
import '../../../models/product.dart';
import '../category/category_view.dart';
import 'catalogue_viewmodel.dart';

class CatalogueView extends StatelessWidget {
  const CatalogueView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CatalogueViewmodel>.reactive(
      onViewModelReady: (model) {
        model.init();
      },
      viewModelBuilder: () {
        return CatalogueViewmodel();
      },
      builder: (BuildContext context, CatalogueViewmodel viewModel, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/images/logo2.png',
                scale: 5,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  viewModel.navigateToSearch();
                },
                icon: const Hero(tag: 'search', child: Icon(Icons.search)),
                iconSize: 35,
                color: const Color(0xFF317773),
              ),
              const SizedBox(width: 15),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                AspectRatio(
                  aspectRatio: 2.5,
                  child: CarouselSlider(
                    slideTransform: DefaultTransform(),
                    unlimitedMode: true,
                    autoSliderTransitionTime: const Duration(seconds: 1),
                    enableAutoSlider: true,autoSliderDelay: const Duration(seconds: 5),
                    slideIndicator: CircularSlideIndicator(
                      padding: const EdgeInsets.only(bottom: 10),
                      indicatorRadius: 5,
                      itemSpacing: 15,
                      currentIndicatorColor: const Color(0xFF317773),
                      indicatorBackgroundColor: const Color(0xFF317773).withOpacity(0.4),
                    ),
                    children: viewModel.imageUrls.map((imageUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                    onSlideChanged: (index) {
                      viewModel.setCurrentIndex(index);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Category',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {
                          viewModel.navigateToCategory();
                        },
                        child: const Text(
                          'See All',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF317773),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          title: viewModel.categories[index]['title']!,
                          image: viewModel.categories[index]['image']!,
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Popular',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {
                          viewModel.navigateToPopular();
                        },
                        child: const Text(
                          'See All',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF317773),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: viewModel.popproducts.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        final product = viewModel.popproducts[index];
                        return ProductCard(product: product, viewModel: viewModel);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'New Arrivals',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {
                          viewModel.navigateToNewArrivals();
                        },
                        child: const Text(
                          'See All',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF317773),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 260,
                  width: MediaQuery.sizeOf(context).width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      itemCount: viewModel.newproducts.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        final product = viewModel.newproducts[index];
                        return ProductCard(product: product, viewModel: viewModel);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final CatalogueViewmodel viewModel;

  const ProductCard(
      {super.key, required this.product, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        viewModel.navigateToCategory();
      },
      child: GestureDetector(
        onTap: () {
          if (product.id == 'nikeairmaxap') {
            viewModel.navigateToProduct();
          }
        },
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              // padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F6F7),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                        child: Image.asset(
                          product.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.brand,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text(
                              '₹${product.price}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '₹${product.originalPrice}',
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: product.isFavorite
                      ? const Color(0xFF317773)
                      : const Color(0xFF317773),
                ),
                onPressed: () {
                  viewModel.toggleFavorite(product);
                  viewModel.notifyListeners();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;

  const CategoryItem({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 2,
                offset: Offset(2, 2),
              ),
            ],
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              image,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}