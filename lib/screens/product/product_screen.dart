import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProductScreen(product: product),
    );
  }

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {},
              ),
              BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  return IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.white),
                    onPressed: () {
                      context
                          .read<WishlistBloc>()
                          .add(AddProductToWishlist(product));

                      const snackBar = SnackBar(
                        content: Text('Added to your Wishlist'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  );
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text(
                  'ADD TO CART',
                  style: Theme.of(context).textTheme.headline3!,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              // autoPlay: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: [HeroCarouselCard(product: product)],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          '\$${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: const Text('Product Information'),
              children: [
                ListTile(
                  title: Text(
                    "Fugiat qui voluptate deserunt nisi culpa ullamco. Ipsum incididunt magna ad excepteur occaecat duis. Aliqua irure ullamco incididunt sit officia excepteur ad nisi aliqua dolore. Eiusmod excepteur adipisicing tempor exercitation pariatur excepteur sunt.",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: const Text('Delivery Information'),
              children: [
                ListTile(
                  title: Text(
                    "Fugiat qui voluptate deserunt nisi culpa ullamco. Ipsum incididunt magna ad excepteur occaecat duis. Aliqua irure ullamco incididunt sit officia excepteur ad nisi aliqua dolore. Eiusmod excepteur adipisicing tempor exercitation pariatur excepteur sunt.",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
