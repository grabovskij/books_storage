import 'package:books_storage/data/local_data_sources/book_storage/src/books_storage_hash_keys.dart';
import 'package:books_storage/domain/models/book_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_model.freezed.dart';

part 'book_model.g.dart';

@freezed
class BookModel with _$BookModel {
  const factory BookModel({
    @JsonKey(name: columnId) int? id,
    @Default('') @JsonKey(name: columnTitle) String title,
    @Default('') @JsonKey(name: columnPublisher) String publisher,
    @Default('') @JsonKey(name: columnAuthor) String author,
    @Default(0) @JsonKey(name: columnYear) num year,
    @Default(0) @JsonKey(name: columnPageCount) num pageCount,
  }) = _BookModel;

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}

extension BookEntity on BookModel {
  static BookModel fromEntity(BookInfo model) {
    return BookModel(
      id: model.id,
      title: model.title,
      publisher: model.publisher,
      author: model.author,
      year: model.year,
      pageCount: model.pageCount,
    );
  }

  BookInfo toEntity() {
    return BookInfo(
      id: id,
      title: title,
      publisher: publisher,
      author: author,
      year: year.toInt(),
      pageCount: pageCount.toInt(),
    );
  }
}
