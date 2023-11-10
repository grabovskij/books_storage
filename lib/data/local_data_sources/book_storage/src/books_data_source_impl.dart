part of '../books_data_source.dart';

class _BooksDataSourceImpl implements BooksDataSource {
  late Database database;
  bool isInit = false;

  @override
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

  @override
  Future<void> dispose() async {
    await database.close().then((_) => isInit = false);
  }

  @override
  Future<BookInfo> create(BookInfo book) async {
    final bookId = await database.insert(
      tableUserBooks,
      BookEntity.fromEntity(book).toJson(),
    );

    return book.copyWith(id: bookId);
  }

  @override
  Future<List<BookInfo>> getAll() async {
    final records = await database.query(tableUserBooks);

    return records.map((e) => BookModel.fromJson(e).toEntity()).toList();
  }

  @override
  Future<int> remove(int id) async {
    return database.delete(
      tableUserBooks,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  FutureOr<void> createDatabase(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $tableUserBooks ('
      '$columnId INTEGER PRIMARY KEY, '
      '$columnTitle TEXT, '
      '$columnPublisher TEXT, '
      '$columnAuthor TEXT, '
      '$columnYear INTEGER, '
      '$columnPageCount INTEGER'
      ')',
    );
  }
}
