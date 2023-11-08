import 'package:flutter/material.dart';

import 'data/local_data_sources/book_storage/books_data_source.dart';
import 'domain/models/book_info.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  BooksState booksState = BooksLoadingState();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => loadData);
  }

  Future<void> loadData() async {
    final BooksDataSource booksDataSource = BooksDataSource();

    try {
      final allBooks = await booksDataSource.getAll();
      booksState = BooksSuccessState(books: allBooks);
    } catch (e) {
      booksState = BooksFailedState(message: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentBooksState = booksState;

    if (currentBooksState is BooksFailedState) {
      // Error view
      currentBooksState.message;
      return Placeholder();
    }

    if (currentBooksState is BooksSuccessState) {
      // Success view

      return BooksListView(
        books: currentBooksState.books,
      );
    }

    // Loading view
    return Placeholder();
  }
}

abstract class BooksState {}

class BooksLoadingState implements BooksState {}

class BooksSuccessState implements BooksState {
  final List<BookInfo> books;

  BooksSuccessState({required this.books});
}

class BooksFailedState implements BooksState {
  final String message;

  BooksFailedState({required this.message});
}

class BooksListView extends StatelessWidget {
  final List<BookInfo> books;

  const BooksListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
