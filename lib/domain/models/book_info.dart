class BookInfo {
  final String title;
  final String publisher;
  final String author;

  ///  Только положительные занчения
  final int year;
  final int pageCount;

  BookInfo({
    this.title = '',
    this.publisher = '',
    this.author = '',
    this.year = -1,
    this.pageCount = 0,
  });
}
