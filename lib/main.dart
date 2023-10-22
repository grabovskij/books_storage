import 'dart:async';
import 'dart:developer';

import 'package:books_storage/domain/models/book_info.dart';
import 'package:flutter/material.dart';

import 'core/app.dart';
import 'data/local_data_sources/book_storage/books_data_source.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      final BooksDataSource booksDataSource = BooksDataSource();
      await booksDataSource.init();
      // booksDataSource.create(
      //   BookInfo(
      //     title: 'Песнь льда и пламени',
      //     author: 'Джордж Мартин',
      //     year: 1996,
      //     publisher: 'АСТ',
      //     pageCount: 650,
      //   ),
      // );
      final allBooks = await booksDataSource.getAll();

      log(allBooks.toString());

      runApp(const App());
    },
    (error, stackTrace) {
      log(
        '[Main isolate]',
        error: error,
        stackTrace: stackTrace,
      );
    },
  );
}
