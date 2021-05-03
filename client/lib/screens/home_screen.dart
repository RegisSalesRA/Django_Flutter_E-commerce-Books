import 'package:client/api/book_api.dart';
import 'package:client/widgets/drower.dart';
import 'package:client/widgets/single_book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screens';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _init = true;
  bool _isLoading = true;
  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoading = await Provider.of<BookState>(context).getBooks();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final book = Provider.of<BookState>(context).book;
    if (!_isLoading)
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Welcome Book"),
        ),
        body: Center(
          child: Text("No data yet"),
        ),
      );
    else
      return Scaffold(
        drawer: AppDrown(),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Welcome Book"),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 3,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: book.length,
          itemBuilder: (ctx, i) => SingleBook(
            id: book[i].id,
            title: book[i].title,
            image: book[i].image,
            favorite: book[i].favorite,
          ),
        ),
      );
  }
}
