import 'package:books_storage/domain/models/book_info.dart';

sealed class LibraryState {}

class LibraryLoadingState extends LibraryState {}

class LibraryLoadedState extends LibraryState {
  List<BookInfo> books;

  LibraryLoadedState({
    required this.books,
  });
}

class LibraryErrorState extends LibraryState {
  final String message;

  LibraryErrorState(this.message);
}
