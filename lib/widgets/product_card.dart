import 'package:ecommerce/models/models.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;

  final bool isWishlist;

  const ProductCard({
    Key? key,
    this.widthFactor = 2.4,
    required this.product,
    this.leftPosition = 5,
    this.isWishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          SizedBox(
            width: widthValue,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              width: widthValue - 5 - leftPosition,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(
              width: widthValue - 15 - leftPosition,
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white)),
                          Text("\$${product.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                    isWishlist
                        ? Expanded(
                            child: IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          )
                        : SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
