import 'dart:async';

import 'package:books_storage/domain/models/book_info.dart';
import 'package:rxdart/rxdart.dart';

class BookManager with StreamParsers {
  final BehaviorSubject<String> _titleSubject = BehaviorSubject.seeded('');
  final BehaviorSubject<String> _authorSubject = BehaviorSubject.seeded('');
  final BehaviorSubject<String> _yearSubject = BehaviorSubject.seeded('-1');
  final BehaviorSubject<String> _publisherSubject = BehaviorSubject.seeded('');
  final BehaviorSubject<String> _pagesCountSubject =
      BehaviorSubject.seeded('0');

  Stream<String> get titleStream => _titleSubject.stream;

  Stream<String> get authorStream => _authorSubject.stream;

  Stream<int> get yearStream => _yearSubject.stream.transform(intParse);

  Stream<String> get publisherStream => _publisherSubject.stream;

  Stream<int> get pagesNumberStream =>
      _pagesCountSubject.stream.transform(intParse);

  Stream<BookInfo> get bookStream => CombineLatestStream(
        [
          titleStream,
          authorStream,
          yearStream,
          publisherStream,
          pagesNumberStream,
        ],
        (values) => BookInfo(
          title: values[0] as String,
          author: values[1] as String,
          year: values[2] as int,
          publisher: values[3] as String,
          pageCount: values[4] as int,
        ),
      );

  void setTitle(String value) => _titleSubject.add(value);

  void setAuthor(String value) => _authorSubject.add(value);

  void setYear(String value) => _yearSubject.add(value);

  void setPublisher(String value) => _publisherSubject.add(value);

  void setPagesNumber(String value) => _pagesCountSubject.add(value);

  void cancel() {
    _titleSubject.close();
    _authorSubject.close();
    _yearSubject.close();
    _publisherSubject.close();
    _pagesCountSubject.close();
  }
}

mixin StreamParsers {
  final intParse = StreamTransformer<String, int>.fromHandlers(
    handleData: (value, sink) {
      sink.add(int.tryParse(value) ?? 0);
    },
  );
}
