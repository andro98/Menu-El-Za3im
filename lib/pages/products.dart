import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped-models/main.dart';
import'../widgets/ui_elements/logout_list_tile.dart';
import '../widgets/products/products.dart';

class ProductsPage extends StatefulWidget {
  final MainModel model;

  ProductsPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _ProductsPageState();
  }
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  initState() {
    widget.model.fetchProducts();
    super.initState();
  }

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          ),
          Divider(),
          LogoutListTile(),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      Widget content = Center(child: Text('No products Found!'));
      if (model.diplayedProducts.length > 0 && !model.isLoading) {
        content = Products();
      } else if (model.isLoading) {
        content = Center(child: CircularProgressIndicator());
      }
      return RefreshIndicator(onRefresh: model.fetchProducts, child: content);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('Menu El 3azim'),
        actions: <Widget>[
          ScopedModelDescendant<MainModel>(
              builder: (BuildContext context, Widget child, MainModel model) {
            return IconButton(
              icon: Icon(model.diplayFavoriteOnly
                  ? Icons.favorite
                  : Icons.favorite_border),
              onPressed: () {
                model.toggleDisplayMode();
              },
            );
          }),
        ],
        elevation: 10.0,
      ),
      body: _buildProductList(),
    );
  }
}
