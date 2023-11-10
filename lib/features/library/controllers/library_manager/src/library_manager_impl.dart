part of '../library_manager.dart';

class _LibraryManager with BooksCRUD implements LibraryManager {
  @override
  final BooksDataSource booksDataSource;
  final BehaviorSubject _readAllSubject = BehaviorSubject();
  final BehaviorSubject<BookInfo> _createSubject = BehaviorSubject();
  final BehaviorSubject<int> _removeSubject = BehaviorSubject();
  final BehaviorSubject<LibraryState> _stateSubject = BehaviorSubject();

  _LibraryManager(this.booksDataSource);

  @override
  LibraryState? get state => _stateSubject.stream.value;

  @override
  Stream<BookInfo> get createdBookStream =>
      _createSubject.map(addLoadingState).asyncMap(createBook);

  Stream<int> get removeBookStream =>
      _removeSubject.map(addLoadingState).asyncMap(removeBook);

  @override
  Stream<LibraryState> get statesStream => MergeStream(
        [
          _readAllSubject.asyncMap(readBooks).map(booksToState),
          createdBookStream.asyncMap(readBooks).map(booksToState),
          removeBookStream.asyncMap(readBooks).map(booksToState),
        ],
      );

  @override
  void read() => _readAllSubject.add(null);

  @override
  void create(BookInfo book) => _createSubject.add(book);

  @override
  void remove(int id) => _removeSubject.add(id);

  T addLoadingState<T>(T value) {
    _stateSubject.add(LibraryLoadingState());

    return value;
  }

  LibraryState booksToState(List<BookInfo> books) {
    return LibraryLoadedState(books: books);
  }

  @override
  void close() {
    _readAllSubject.close();
    _createSubject.close();
    _stateSubject.close();
  }
}
