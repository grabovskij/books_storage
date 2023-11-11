part of '../library_manager.dart';

class _LibraryManager with StatesEmission, BooksCRUD implements LibraryManager {
  @override
  final BooksDataSource booksDataSource;

  // Library state
  final BehaviorSubject<LibraryState> _stateSubject =
      BehaviorSubject.seeded(LibraryLoadingState());

  // Library actions
  final BehaviorSubject<dynamic> _readBooksSubject = BehaviorSubject();
  final BehaviorSubject<BookInfo> _createBookSubject = BehaviorSubject();
  final BehaviorSubject<int> _removeBookSubject = BehaviorSubject();

  _LibraryManager(this.booksDataSource) {
    _readBooksSubject
        .map(emitLoadingState)
        .asyncMap(readBooks)
        .listen(emitLoadedState, onError: emitErrorState);
    _createBookSubject
        .map(emitLoadingState)
        .asyncMap(createBook)
        .asyncMap(readBooks)
        .listen(emitLoadedState, onError: emitErrorState);
    _removeBookSubject
        .map(emitLoadingState)
        .asyncMap(removeBook)
        .asyncMap(readBooks)
        .listen(emitLoadedState, onError: emitErrorState);
  }

  @override
  StreamSink<LibraryState> get statesSink => _stateSubject.sink;

  @override
  LibraryState get state => _stateSubject.stream.value;

  @override
  Stream<LibraryState> get statesStream => _stateSubject.stream;

  @override
  void read() => _readBooksSubject.add(null);

  @override
  void create(BookInfo book) => _createBookSubject.add(book);

  @override
  void remove(int id) => _removeBookSubject.add(id);

  @override
  void close() {
    _stateSubject.close();
    _readBooksSubject.close();
    _createBookSubject.close();
    _removeBookSubject.close();
  }
}
