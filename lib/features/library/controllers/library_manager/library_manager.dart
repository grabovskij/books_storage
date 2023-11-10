import 'dart:async';

import 'package:books_storage/data/local_data_sources/book_storage/books_data_source.dart';
import 'package:books_storage/domain/models/book_info.dart';
import 'package:books_storage/features/library/states/library_states.dart';
import 'package:rxdart/rxdart.dart';

import 'src/books_crud_operations_mixin.dart';

part 'src/library_manager_impl.dart';

abstract class LibraryManager {
  LibraryState? get state;

  Stream<BookInfo> get createdBookStream;

  Stream<LibraryState> get statesStream;

  void read();

  void create(BookInfo book);

  void remove(int id);

  void close() {}

  factory LibraryManager(BooksDataSource booksDataSource) =>
      _LibraryManager(booksDataSource);
}
