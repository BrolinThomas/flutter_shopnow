import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:shopnow/app/app.router.dart';
import 'package:shopnow/services/cart_service.dart';
import 'package:shopnow/services/wishlist_service.dart';
import '../../../app/utils.dart';
import '../../../models/product.dart';
import '../catalogue/catalogue_viewmodel.dart';
import '../popular/popular_viewmodel.dart';

class ProductpageViewmodel extends BaseViewModel {
  final CartService _cartService = GetIt.instance<CartService>();
  final WishlistService _wishlistService = GetIt.instance<WishlistService>();

  ProductpageViewmodel() {
    _wishlistService.addListener(_onWishlistChanged);
  }

  final List<String> imageUrls = [
    'assets/images/pslider1.png',
    'assets/images/pslider2.png',
    'assets/images/pslider3.png'
  ];

  List<Product> products = [
    Product(
      id: 'nikeairmaxap',
      brand: 'Nike',
      name: 'Nike Air Max AP',
      imageUrl: 'assets/images/nikeairmaxap.png',
      price: 6000,
      originalPrice: 7000,
    ),
    // Add more products as needed
  ];

  int _currentIndex = 0;
  bool _isAddedToCart = false;

  int get currentIndex => _currentIndex;
  bool get isAddedToCart => _isAddedToCart;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void init() {
    for (var product in products) {
      product.isFavorite =
          _wishlistService.wishlist.any((p) => p.id == product.id);
    }
    notifyListeners();
  }

  void addToCart(Product product) {
    _cartService.isProductInCart(product)
        ? debugPrint('Prevented duplicate')
        : _cartService.addToCart(product);
    _isAddedToCart = true;
    notifyListeners();
  }

  void toggleFavorite(Product product) {
    product.isFavorite = !product.isFavorite;
    if (product.isFavorite) {
      _wishlistService.addProduct(product);
    } else {
      _wishlistService.removeProduct(product);
    }
    notifyListeners();
    GetIt.instance<CatalogueViewmodel>().notifyListeners();
    GetIt.instance<PopularViewmodel>().notifyListeners();
  }

  void _onWishlistChanged() {
    for (var product in products) {
      product.isFavorite =
          _wishlistService.wishlist.any((p) => p.id == product.id);
    }
    notifyListeners();
  }

  void gotocart() {
    navigationService.navigateTo(Routes.mycartView);
  }

  @override
  void dispose() {
    _wishlistService.removeListener(_onWishlistChanged);
    super.dispose();
  }
}
