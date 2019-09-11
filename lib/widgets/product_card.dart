import 'package:bright_app/bright_app_icons.dart';
/**
 *
 * ProductCardWidget
 *
 */
import 'package:flutter/material.dart';

class ProductCardWidget extends StatefulWidget {
  @override
  _ProductCardWidgetState createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 136,
        height: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.cyan,
        ),
        padding: EdgeInsets.all(8),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Nike'.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'AIR-MAX',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '\$150.00',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Positioned.fill(
            top: -154,
            right: -100,
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
        ]),
      ),
    );
  }
}
