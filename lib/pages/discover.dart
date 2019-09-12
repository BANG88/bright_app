import 'package:bright_app/widgets/product_card.dart';
import 'package:bright_app/widgets/product_new.dart';
import 'package:bright_app/widgets/product_view.dart';
/**
 *
 * DiscoverPage
 *
 */
import 'package:flutter/material.dart';

import '../bright_app_icons.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  var brands = [
    'Nike',
    'Adidas',
    'Jordan',
    'Puma',
    'Reebok',
    'Fila',
    'Mizuno',
    'KAPPA'
  ];

  var tabs = [
    BrightApp.home,
    BrightApp.heart,
    BrightApp.map_marker,
    BrightApp.cart,
    BrightApp.user
  ];
  int initial = 0;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return DefaultTabController(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          brightness: Brightness.light,
          title: Text(
            'Discover',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            RawMaterialButton(
              onPressed: () {},
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 18,
              ),
              shape: CircleBorder(),
              fillColor: Color(0xfff5f5f5),
              elevation: 0,
              constraints: BoxConstraints(
                minWidth: 26,
                minHeight: 26,
              ),
            ),
            RawMaterialButton(
              onPressed: () {},
              child: Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 18,
              ),
              shape: CircleBorder(),
              fillColor: Color(0xfff5f5f5),
              elevation: 0,
              constraints: BoxConstraints(
                minWidth: 26,
                minHeight: 26,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
                tabs: brands
                    .map(
                      (brand) => Tab(
                        text: brand,
                      ),
                    )
                    .toList()),
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: brands
              .map(
                (brand) => ListView(
                  children: <Widget>[
                    ProductViewWidget(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'More',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.trending_flat,
                              size: 18,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 10,
                        children: products
                            .map(
                              (product) => ProductNewWidget(
                                product: product,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: tabs.map((t) {
                int index = tabs.indexOf(t);
                return Expanded(
                  child: IconButton(
                    icon: Icon(
                      t,
                      color:
                          initial == index ? theme.primaryColor : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        initial = index;
                      });
                    },
                  ),
                );
              }).toList()),
        ),
      ),
      length: brands.length,
    );
  }
}
