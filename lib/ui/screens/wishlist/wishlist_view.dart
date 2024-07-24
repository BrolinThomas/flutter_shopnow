import 'package:lottie/lottie.dart';
import 'package:shopnow/constants/fonts.gen.dart';
import 'package:shopnow/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import '../catalogue/catalogue_viewmodel.dart';
import 'wishlist_viewmodel.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WishlistViewModel>.reactive(
      onViewModelReady: (model) {
        model.init();
      },
      viewModelBuilder: () => WishlistViewModel(),
      builder:
          (BuildContext context, WishlistViewModel viewModel, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Wishlist'),
          ),
          body: viewModel.wishlist.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        Opacity(
                          opacity: 0.7,
                          child: Lottie.asset('assets/images/personempty.json',
                              repeat: true, width: 300, fit: BoxFit.fill),
                        ),
                        const Text(
                          'Your Wishlist is empty!',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ],
                    ),
                  ],
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.wishlist.length,
                    itemBuilder: (context, index) {
                      final product = viewModel.wishlist[index];
                      return Card(
                        color: const Color(0xFFEDE8E9),
                        elevation: 5,
                        margin: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 15, top: 5),
                        child: Column(
                          children: [
                            ListTile(
                              leading: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: Image.asset(
                                    product.imageUrl,
                                    fit: BoxFit.cover,
                                    width: 70,
                                    height: 70,
                                  )),
                              title: Text(
                                product.name,
                                style: const TextStyle(fontSize: 14),
                              ),
                              subtitle: Text(
                                '₹${product.price}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  viewModel.toggleFavorite(product);
                                  viewModel.notifyListeners();
                                },
                                icon: Icon(
                                  product.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Color(0xFF317773),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFF317773),
                                ),
                                margin: const EdgeInsets.only(
                                    bottom: 10, left: 10, right: 10, top: 5),
                                height: 40,
                                width: double.infinity,
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Add To Cart',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
