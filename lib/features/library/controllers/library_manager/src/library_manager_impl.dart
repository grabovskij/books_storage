part of '../library_manager.dart';

class _LibraryManager with StatesEmission, BooksCRUD implements LibraryManager {
  @override
  final BooksDataSource booksDataSource;

  final BehaviorSubject _readAllSubject = BehaviorSubject();
  final BehaviorSubject<BookInfo> _createSubject = BehaviorSubject();
  final BehaviorSubject<int> _removeSubject = BehaviorSubject();
  final BehaviorSubject<LibraryState> _stateSubject = BehaviorSubject();

  _LibraryManager(this.booksDataSource);

  @override
  StreamSink<LibraryState> get statesSink => _stateSubject.sink;

  @override
  LibraryState? get state => _stateSubject.stream.value;

  @override
  Stream<BookInfo> get createdBookStream =>
      _createSubject.map(emitLoadingState).asyncMap(createBook);

  @override
  Stream<int> get removeBookStream =>
      _removeSubject.map(emitLoadingState).asyncMap(removeBook);

  @override
  Stream<LibraryState> get statesStream => MergeStream([
        _readAllSubject.asyncMap(readBooks).map(emitLoadedState),
        createdBookStream.asyncMap(readBooks).map(emitLoadedState),
        removeBookStream.asyncMap(readBooks).map(emitLoadedState),
      ]);

  @override
  void create(BookInfo book) => _createSubject.add(book);

  @override
  void read() => _readAllSubject.add(null);

  @override
  void remove(int id) => _removeSubject.add(id);

  @override
  void close() {
    _readAllSubject.close();
    _createSubject.close();
    _stateSubject.close();
  }
}
