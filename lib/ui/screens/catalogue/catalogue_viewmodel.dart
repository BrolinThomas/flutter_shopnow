import 'package:shopnow/app/app.router.dart';
import 'package:shopnow/app/utils.dart';
import 'package:shopnow/ui/screens/productpage/productpage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../models/product.dart';
import '../../../services/wishlist_service.dart';
import '../popular/popular_viewmodel.dart';

class CatalogueViewmodel extends BaseViewModel {
  final WishlistService _wishlistService = GetIt.instance<WishlistService>();
  RouteTransitionsBuilder noAnimationTransition = (_, __, ___, child) => child;

  final List<String> imageUrls = [
    'assets/images/slidera.png',
    'assets/images/sliderb.png',
    'assets/images/sliderc.png'
  ];

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  CatalogueViewmodel() {
    _wishlistService.addListener(_onWishlistChanged);
  }

  void init() {
    for (var product in popproducts) {
      product.isFavorite =
          _wishlistService.wishlist.any((p) => p.id == product.id);
    }
    for (var product in newproducts) {
      product.isFavorite =
          _wishlistService.wishlist.any((p) => p.id == product.id);
    }
    notifyListeners();
  }

  List<Product> popproducts = [
    Product(
      id: 'nikeairmaxap',
      brand: 'Nike',
      name: 'Nike Air Max AP',
      imageUrl: 'assets/images/nikeairmaxap.png',
      price: 6000,
      originalPrice: 7000,
    ),
    Product(
      id: 'nikeimpact4v',
      brand: 'Nike',
      name: 'Nike Impact 4v',
      imageUrl: 'assets/images/nikeimpact4v.png',
      price: 6000,
      originalPrice: 7000,
    ),
  ];
  List<Product> newproducts = [
    Product(
      id: 'jordan23engineered',
      brand: 'Nike',
      name: 'Jordan 23 Engineered',
      imageUrl: 'assets/images/nejordan.png',
      price: 2000,
      originalPrice: 4000,
    ),
    Product(
      id: 'crewnecksweatshirt',
      brand: 'Nike',
      name: 'Crew-Neck Sweatshirt',
      imageUrl: 'assets/images/necrewneck.png',
      price: 2000,
      originalPrice: 4000,
    ),
  ];
  final List<Map<String, String>> categories = [
    {'title': 'Shirts', 'image': 'assets/images/cshirt.png'},
    {'title': 'Shoes', 'image': 'assets/images/shoeb.jpg'},
  ];

  void toggleFavorite(Product product) {
    product.isFavorite = !product.isFavorite;
    if (product.isFavorite) {
      _wishlistService.addProduct(product);
    } else {
      _wishlistService.removeProduct(product);
    }
    notifyListeners();
    GetIt.instance<PopularViewmodel>().notifyListeners();
    GetIt.instance<ProductpageViewmodel>().notifyListeners();
  }

  void _onWishlistChanged() {
    for (var product in popproducts) {
      product.isFavorite =
          _wishlistService.wishlist.any((p) => p.id == product.id);
    }
    for (var product in newproducts) {
      product.isFavorite =
          _wishlistService.wishlist.any((p) => p.id == product.id);
    }
    notifyListeners(); // Notify the view about the change
  }

  void navigateToPopular() {
    navigationService.navigateTo(Routes.popularView);
  }

  void navigateToNewArrivals() {
    navigationService.navigateTo(Routes.newarrivalsView);
  }

  void navigateToCategory() {
    navigationService.navigateTo(Routes.categoryView);
  }

  void navigateToSearch() {
    navigationService.navigateTo(Routes.searchView,transition: noAnimationTransition);
  }

  void navigateToProduct() {
    navigationService.navigateTo(Routes.productpageView);
  }

  @override
  void dispose() {
    _wishlistService.removeListener(_onWishlistChanged);
    super.dispose();
  }
}
