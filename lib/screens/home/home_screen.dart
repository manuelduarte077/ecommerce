import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const CustomAppBar(title: "Unicorn Store"),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Text(
            "Unicorn Store",
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, '/wishlist');
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                // autoPlay: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: Category.categories
                  .map((category) => HeroCarouselCard(category: category))
                  .toList(),
            ),
            const SectionTitle(
              title: "Recommended",
            ),
            ProductCarousel(
              products: Product.products
                  .where((product) => product.isRecommended)
                  .toList(),
            ),
            const SectionTitle(
              title: "Most Popular",
            ),
            ProductCarousel(
              products:
                  Product.products.where((product) => product.isPopular).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
