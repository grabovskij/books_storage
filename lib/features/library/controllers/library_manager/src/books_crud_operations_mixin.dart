import 'package:books_storage/data/local_data_sources/book_storage/books_data_source.dart';
import 'package:books_storage/domain/models/book_info.dart';

mixin BooksCRUD {
  BooksDataSource get booksDataSource;

  Future<BookInfo> createBook(BookInfo book) => booksDataSource.create(book);

  Future<int> removeBook(int id) => booksDataSource.remove(id);

  Future<List<BookInfo>> readBooks(_) => booksDataSource.getAll();
}
