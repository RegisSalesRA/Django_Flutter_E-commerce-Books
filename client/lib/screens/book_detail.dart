import 'package:client/api/book_api.dart';
import 'package:client/api/cart_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetails extends StatelessWidget {
  static const routeName = '/product-details-screen';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final book = Provider.of<BookState>(context).singleBook(id);

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Book Details")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Image.network(
              "http://10.0.2.2:8000${book.image}",
              fit: BoxFit.cover,
              height: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Market Price : \$${book.marcketPrice.toString()}"),
                    Text("Selling Price : \$${book.sellingPrice.toString()}"),
                  ],
                ),
                // ignore: deprecated_member_use
                RaisedButton.icon(
                  color: Colors.green,
                  onPressed: () {
                    Provider.of<CartState>(context, listen: false)
                        .addtoCart(id);
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Add to cart",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Text(book.description)
          ],
        ),
      ),
    );
  }
}
