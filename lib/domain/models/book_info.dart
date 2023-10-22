class BookInfo {
  final String title;
  final String publisher;
  final String author;

  ///  Только положительные занчения
  final int? id;
  final int year;
  final int pageCount;

  BookInfo({
    this.title = '',
    this.publisher = '',
    this.author = '',
    this.year = -1,
    this.pageCount = 0,
    this.id,
  });

  BookInfo copyWith({
    int? id,
    String? title,
    String? publisher,
    String? author,
    int? year,
    int? pageCount,
  }) {
    return BookInfo(
      id: id ?? this.id,
      title: title ?? this.title,
      publisher: publisher ?? this.publisher,
      author: author ?? this.author,
      year: year ?? this.year,
      pageCount: pageCount ?? this.pageCount,
    );
  }

  @override
  String toString() {
    return 'BookInfo(id: $id, title: $title, publisher: $publisher, author: $author, year: $year, pageCount: $pageCount)';
  }
}
