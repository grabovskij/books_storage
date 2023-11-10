import 'dart:async';

import 'package:books_storage/domain/models/book_info.dart';
import 'package:books_storage/features/library/states/library_states.dart';

mixin StatesEmission {
  StreamSink<LibraryState> get statesSink;

  LibraryState emitLoadedState(List<BookInfo> books) {
    return LibraryLoadedState(books: books);
  }

  T emitLoadingState<T>(T value) {
    statesSink.add(LibraryLoadingState());

    return value;
  }
}