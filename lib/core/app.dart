import 'package:books_storage/data/local_data_sources/book_storage/books_data_source.dart';
import 'package:books_storage/features/library/library_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  final BooksDataSource booksDataSource;

  const App({
    required this.booksDataSource,
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void dispose() {
    widget.booksDataSource.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: widget.booksDataSource,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LibraryPage(),
      ),
    );
  }
}
