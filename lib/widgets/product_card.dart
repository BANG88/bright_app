import 'package:bright_app/bright_app_icons.dart';
/**
 *
 * ProductCardWidget
 *
 */
import 'package:flutter/material.dart';

class Product {
  final String title;
  final String brand;
  final double price;
  final String image;
  final MaterialColor color;
  Product(this.title, this.brand, this.price, this.image, this.color);
}

class ProductCardWidget extends StatelessWidget {
  final Product product;

  const ProductCardWidget({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: product.color,
      ),
      padding: EdgeInsets.all(8),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            height: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  product.brand,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  product.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            top: -160,
            right: -130,
            child: IconButton(
              splashColor: Colors.transparent,
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 18,
              ),
              onPressed: () {},
            ),
          ),
          Positioned.fill(
            bottom: 10,
            right: -20,
            child: Transform.rotate(
              child: Image.asset(
                product.image,
                fit: BoxFit.fitHeight,
              ),
              angle: -0.4,
            ),
          ),
          Positioned.fill(
            bottom: -160,
            right: -120,
            child: IconButton(
              splashColor: Colors.transparent,
              icon: Icon(
                BrightApp.arrow_right,
                color: Colors.white,
                size: 18,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
