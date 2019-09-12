import 'package:bright_app/widgets/product_card.dart';
/**
 *
 * ProductNewWidget
 *
 */
import 'package:flutter/material.dart';

class ProductNewWidget extends StatelessWidget {
  final Product product;

  const ProductNewWidget({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 180,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20.0, // has the effect of softening the shadow
            spreadRadius: 1.0, // has the effect of extending the shadow
            offset: Offset(
              1.0, // horizontal, move right 10
              1.0, // vertical, move down 10
            ),
          )
        ],
        borderRadius: new BorderRadius.circular(4),
      ),
      child: Stack(
        children: <Widget>[
          RotatedBox(
            child: Container(
              color: Colors.pinkAccent,
              padding: EdgeInsets.only(
                left: 8,
                right: 8,
                top: 2,
                bottom: 0,
              ),
              child: Text(
                'NEW',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
            quarterTurns: 3,
          ),
          Image.asset(
            product.image,
            fit: BoxFit.contain,
            width: 140,
          )
        ],
      ),
    );
  }
}
