import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const WishListScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Wish List"),
      bottomNavigationBar: const CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 2.4),
        itemCount: Product.products.length,
        itemBuilder: (context, int index) {
          return Center(
            child: ProductCard(
              product: Product.products[index],
              widthFactor: 1.1,
              leftPosition: 100,
              isWishlist: true,
            ),
          );
        },
      ),
    );
  }
}
