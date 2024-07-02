import 'package:shopnow/constants/fonts.gen.dart';
import 'package:shopnow/ui/screens/productpage/productpage_viewmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../models/product.dart';

class ProductpageView extends StatelessWidget {
  const ProductpageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = Product(
        id: 'nikeairmaxap',
        brand: 'Nike',
        name: 'Nike Air Max AP',
        imageUrl: 'assets/images/nikeairmaxap.png',
        price: 6000,
        originalPrice: 7000,
    );
    return ViewModelBuilder<ProductpageViewmodel>.reactive(
      onViewModelReady: (model) {
        model.init();
      },
      viewModelBuilder: () {
        return ProductpageViewmodel();
      },
      builder: (BuildContext context, ProductpageViewmodel viewModel,
          Widget? child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Color(0xFF317773)),
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Image.asset(
              'assets/images/cartifyicon.png',
              scale: 1.75,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  viewModel.gotocart();
                },
                icon: const Icon(Icons.shopping_cart_outlined),
                iconSize: 35,
                color: const Color(0xFF317773),
              ),
              const SizedBox(width: 15),
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1.5,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      viewModel.setCurrentIndex(index);
                    },
                  ),
                  items: viewModel.imageUrls.map((imageUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height,
                          margin: const EdgeInsets.only(
                            left: 50,
                            right: 50,
                          ),
                          child: ClipRRect(
                            child: Image.asset(
                              imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: viewModel.imageUrls.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => viewModel.setCurrentIndex(entry.key),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: viewModel.currentIndex == entry.key
                              ? Colors.green
                              : Colors.greenAccent.withOpacity(0.4),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                // Product Name and Favorite Icon-------------------------------
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nike',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Air Max AP',
                          style: TextStyle(fontSize: 30, color: Colors.black87),
                        ),
                        IconButton(
                          icon: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Color(0xFF317773),
                          ),
                          onPressed: () {
                            viewModel.toggleFavorite(product);
                            viewModel.notifyListeners();
                          },
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16.0),
                // Size Section-------------------------------------------------
                const Text(
                  'Size',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Card 1----------------------------------------------------
                    Card(
                      color: Color(0xffF1F1EF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                          color: Color(0xFF317773),
                          width: 1.5,
                        ),
                      ),
                      child: const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                          '6',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    //Card 2----------------------------------------------------
                    Card(
                      color: const Color(0xFF317773),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                          '7',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    //Card 3----------------------------------------------------
                    Card(
                      color: const Color(0xffF1F1EF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                          color: Color(0xFF317773),
                          width: 1.5,
                        ),
                      ),
                      child: const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                          '8',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    //Card 4----------------------------------------------------
                    Card(
                      color: const Color(0xffF1F1EF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                          color: Color(0xFF317773),
                          width: 1.5,
                        ),
                      ),
                      child: const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                          '9',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    //Card 5----------------------------------------------------
                    Card(
                      color: const Color(0xffF1F1EF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                          color: Color(0xFF317773),
                          width: 1.5,
                        ),
                      ),
                      child: const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        child: Text(
                          '10',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                // Color Section------------------------------------------------
                const Text(
                  'Color',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black)),
                      child: Center(
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Colors.cyan,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Colors.black87,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),

                const SizedBox(height: 16.0),
                // Product Details Section--------------------------------------
                const Text(
                  'Product Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'With its sleek, sporty design, the Nike Air Max AP lets you bridge past and present in first-class comfort.',
                ),
                const SizedBox(height: 16.0),
                // Customer Review Section
                const Text(
                  'Customer Review',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                // Reviews
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(10)),
                  child: const ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    leading: CircleAvatar(
                      backgroundImage:
                      AssetImage('assets/images/naslimfit.png'), // Example image
                    ),
                    title: Text('Tony'),
                    subtitle: Text(
                      'Comfortable to wear.',
                      style: TextStyle(fontSize: 16, color: Color(0xFF317773)),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.black87),
                        Text(
                          '4.5',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(10)),
                  child: const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/necrewneck.png'),
                    ),
                    title: Text('Alen'),
                    subtitle: Text(
                      'Perfect fit!',
                      style: TextStyle(fontSize: 16, color: Color(0xFF317773)),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.black87),
                        Text(
                          '5.0',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10)]),
            child: BottomAppBar(
              height: 90,
              shadowColor: Colors.black,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '₹ 6,000',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 220,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.isAddedToCart
                            ? ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item already added'),
                          ),
                        )
                            : viewModel.addToCart(product);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF317773),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        viewModel.isAddedToCart
                            ? 'Added Successfully'
                            : 'Add to Cart',
                        style: const TextStyle(fontSize: 19, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}