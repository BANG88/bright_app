import 'package:bright_app/widgets/product_card.dart';
/**
 *
 * ProductViewWidget
 *
 */
import 'package:flutter/material.dart';

class ProductViewWidget extends StatefulWidget {
  @override
  _ProductViewWidgetState createState() => _ProductViewWidgetState();
}

class _ProductViewWidgetState extends State<ProductViewWidget> {
  PageController _pageController;
  List<Product> products = [
    Product('AIR-MAX', 'NIKE', 130, 'assets/air-max-270.png', Colors.cyan),
    Product('AIR-MAX', 'NIKE', 160, 'assets/air-max-270-react.png',
        Colors.blueGrey),
    Product('AIR-MAX', 'NIKE', 140, 'assets/shox-bb4-qs.png', Colors.lime),
    Product('AIR-MAX', 'NIKE', 150, 'assets/air-vapormax-flyknit-3.png',
        Colors.teal),
  ];
  var currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.6,
    );
    _pageController.addListener(() {
      currentPageValue = _pageController.page;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  var tags = ['Upcoming', 'Featured', 'New'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: EdgeInsets.only(
        top: 20,
      ),
      child: Stack(
        children: <Widget>[
          PageView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: products.length,
            controller: _pageController,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Container(
                  width: 160,
                  height: 220,
                  child: ProductCardWidget(
                    product: products[index],
                    animate: currentPageValue.floor() == index,
                  ),
                ),
              );
            },
          ),
          Container(
            color: Colors.white,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: tags
                  .map(
                    (tag) => RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: tags.indexOf(tag) == 1
                              ? Colors.black
                              : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
