import 'dart:async';

import 'package:books_storage/domain/models/book_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'books_data_source.freezed.dart';
part 'books_data_source.g.dart';

const String tableUserBooks = 'user_books';
const String columnId = 'id';
const String columnTitle = 'title';
const String columnPublisher = 'publisher';
const String columnAuthor = 'author';
const String columnYear = 'year';
const String columnPageCount = 'pageCount';

@freezed
class BookModel with _$BookModel {
  const factory BookModel({
    @JsonKey(name: columnId) int? id,
    @Default('') @JsonKey(name: columnTitle) String title,
    @Default('') @JsonKey(name: columnPublisher) String publisher,
    @Default('') @JsonKey(name: columnAuthor) String author,
    @Default(0) @JsonKey(name: columnYear) num year,
    @Default(0) @JsonKey(name: columnPageCount) num pageCount,
  }) = _BookModel;

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}

extension BookEntity on BookModel {
  static BookModel fromEntity(BookInfo model) {
    return BookModel(
      id: model.id,
      title: model.title,
      publisher: model.publisher,
      author: model.author,
      year: model.year,
      pageCount: model.pageCount,
    );
  }

  BookInfo toEntity() {
    return BookInfo(
      id: id,
      title: title,
      publisher: publisher,
      author: author,
      year: year.toInt(),
      pageCount: pageCount.toInt(),
    );
  }
}

class BooksDataSource {
  late Database database;
  bool isInit = false;

  Future<void> init() async {
    if (isInit) {
      return;
    }

    var databasesPath = await getDatabasesPath();
    String path = '$databasesPath/user_books.db';

    database = await openDatabase(
      path,
      version: 1,
      onCreate: createDatabase,
    );
  }

  Future<void> dispose() async {
    await database.close().then((value) => isInit = false);
  }

  Future<BookInfo> create(BookInfo book) async {
    final bookId = await database.insert(
      tableUserBooks,
      BookEntity.fromEntity(book).toJson(),
    );

    return book.copyWith(id: bookId);
  }

  Future<List<BookInfo>> getAll() async {
    final records = await database.query(tableUserBooks);
    return records.map((e) => BookModel.fromJson(e).toEntity()).toList();
  }

  FutureOr<void> createDatabase(Database db, int version) async {
    await db.execute('CREATE TABLE $tableUserBooks ('
        '$columnId INTEGER PRIMARY KEY, '
        '$columnTitle TEXT, '
        '$columnPublisher TEXT, '
        '$columnAuthor TEXT, '
        '$columnYear INTEGER, '
        '$columnPageCount INTEGER'
        ')');
  }
}
