import 'dart:math';

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

class ProductCardWidget extends StatefulWidget {
  final Product product;
  final bool animate;
  const ProductCardWidget({Key key, this.product, this.animate})
      : super(key: key);

  @override
  _ProductCardWidgetState createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    if (widget.animate) {
      controller.forward(from: 0.8);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: widget.product.color,
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
                  widget.product.brand,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  widget.product.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '\$${widget.product.price.toStringAsFixed(2)}',
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
            bottom: 0,
            right: -40,
            child: AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget _widget) =>
                  Transform.rotate(
                child: Image.asset(
                  widget.product.image,
                  fit: BoxFit.fitHeight,
                ),
                angle: controller.value * 5.8,
              ),
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
