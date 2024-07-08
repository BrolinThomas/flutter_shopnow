import 'package:shopnow/constants/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'search_viewmodel.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewmodel>.reactive(
      onViewModelReady: (model) {
        model.init();
      },
      viewModelBuilder: () {
        return SearchViewmodel();
      },
      builder:
          (BuildContext context, SearchViewmodel viewModel, Widget? child) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Search'),
                iconTheme: const IconThemeData(color: Color(0xFF317773))),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFDFDCDD),
                          labelText: 'Search',
                          labelStyle: const TextStyle(
                              fontSize: 20, color: Colors.black54),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none),
                          prefixIcon: const Hero(
                            tag: 'search',
                            child: Icon(
                              Icons.search,
                              size: 35,
                              color: Color(0xFF317773),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Lottie.asset('assets/images/Animationsearch.json',
                              height: 200, width: 200, fit: BoxFit.fill),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'What are you looking for?',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
