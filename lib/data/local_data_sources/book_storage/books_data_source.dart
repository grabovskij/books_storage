import 'dart:async';

import 'package:books_storage/domain/models/book_info.dart';
import 'package:sqflite/sqflite.dart';

import 'src/books_storage_hash_keys.dart';
import 'src/models/book_model.dart';


part 'src/books_data_source_impl.dart';

abstract class BooksDataSource {
  factory BooksDataSource() => _BooksDataSourceImpl();

  Future<void> init();

  Future<void> dispose();

  Future<BookInfo> create(BookInfo book);

  Future<List<BookInfo>> getAll();
}
