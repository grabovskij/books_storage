import 'dart:async';

import 'package:books_storage/domain/models/book_info.dart';
import 'package:books_storage/features/library/states/library_states.dart';

mixin StatesEmission {
  StreamSink<LibraryState> get statesSink;

  void emitLoadedState(List<BookInfo> books) {
    statesSink.add(LibraryLoadedState(books: books));
  }

  void emitErrorState(error) {
    statesSink.add(LibraryErrorState(error.toString()));
  }

  T emitLoadingState<T>(T value) {
    statesSink.add(LibraryLoadingState());

    return value;
  }
}
