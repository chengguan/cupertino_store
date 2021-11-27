import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'model/app_state_model.dart';
import 'product_row_item.dart';      // NEW

class ProductListTab extends StatelessWidget {
  const ProductListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Consumer<AppStateModel>(
        builder: (context, model, child) {
          final products = model.getProducts(); // NEW
          return CustomScrollView(
            semanticChildCount: products.length, // NEW
            slivers: <Widget>[
              const CupertinoSliverNavigationBar(
                largeTitle: Text('Cupertino Store'),
              ),
              SliverSafeArea(   // BEGINNING OF NEW CONTENT
                top: false,
                minimum: const EdgeInsets.only(top: 8),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      if (index < products.length) {
                        return ProductRowItem(
                          product: products[index],
                          lastItem: index == products.length - 1,
                        );
                      }

                      return null;
                    },
                  ),
                ),
              )     // END OF NEW CONTENT
            ],
          );
        },
      ),
    );
  }
}