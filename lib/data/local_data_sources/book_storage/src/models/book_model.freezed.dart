// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookModel _$BookModelFromJson(Map<String, dynamic> json) {
  return _BookModel.fromJson(json);
}

/// @nodoc
mixin _$BookModel {
  @JsonKey(name: columnId)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: columnTitle)
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: columnPublisher)
  String get publisher => throw _privateConstructorUsedError;
  @JsonKey(name: columnAuthor)
  String get author => throw _privateConstructorUsedError;
  @JsonKey(name: columnYear)
  num get year => throw _privateConstructorUsedError;
  @JsonKey(name: columnPageCount)
  num get pageCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookModelCopyWith<BookModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookModelCopyWith<$Res> {
  factory $BookModelCopyWith(BookModel value, $Res Function(BookModel) then) =
      _$BookModelCopyWithImpl<$Res, BookModel>;
  @useResult
  $Res call(
      {@JsonKey(name: columnId) int? id,
      @JsonKey(name: columnTitle) String title,
      @JsonKey(name: columnPublisher) String publisher,
      @JsonKey(name: columnAuthor) String author,
      @JsonKey(name: columnYear) num year,
      @JsonKey(name: columnPageCount) num pageCount});
}

/// @nodoc
class _$BookModelCopyWithImpl<$Res, $Val extends BookModel>
    implements $BookModelCopyWith<$Res> {
  _$BookModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? publisher = null,
    Object? author = null,
    Object? year = null,
    Object? pageCount = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as num,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookModelImplCopyWith<$Res>
    implements $BookModelCopyWith<$Res> {
  factory _$$BookModelImplCopyWith(
          _$BookModelImpl value, $Res Function(_$BookModelImpl) then) =
      __$$BookModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: columnId) int? id,
      @JsonKey(name: columnTitle) String title,
      @JsonKey(name: columnPublisher) String publisher,
      @JsonKey(name: columnAuthor) String author,
      @JsonKey(name: columnYear) num year,
      @JsonKey(name: columnPageCount) num pageCount});
}

/// @nodoc
class __$$BookModelImplCopyWithImpl<$Res>
    extends _$BookModelCopyWithImpl<$Res, _$BookModelImpl>
    implements _$$BookModelImplCopyWith<$Res> {
  __$$BookModelImplCopyWithImpl(
      _$BookModelImpl _value, $Res Function(_$BookModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? publisher = null,
    Object? author = null,
    Object? year = null,
    Object? pageCount = null,
  }) {
    return _then(_$BookModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as num,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookModelImpl implements _BookModel {
  const _$BookModelImpl(
      {@JsonKey(name: columnId) this.id,
      @JsonKey(name: columnTitle) this.title = '',
      @JsonKey(name: columnPublisher) this.publisher = '',
      @JsonKey(name: columnAuthor) this.author = '',
      @JsonKey(name: columnYear) this.year = 0,
      @JsonKey(name: columnPageCount) this.pageCount = 0});

  factory _$BookModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookModelImplFromJson(json);

  @override
  @JsonKey(name: columnId)
  final int? id;
  @override
  @JsonKey(name: columnTitle)
  final String title;
  @override
  @JsonKey(name: columnPublisher)
  final String publisher;
  @override
  @JsonKey(name: columnAuthor)
  final String author;
  @override
  @JsonKey(name: columnYear)
  final num year;
  @override
  @JsonKey(name: columnPageCount)
  final num pageCount;

  @override
  String toString() {
    return 'BookModel(id: $id, title: $title, publisher: $publisher, author: $author, year: $year, pageCount: $pageCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, publisher, author, year, pageCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookModelImplCopyWith<_$BookModelImpl> get copyWith =>
      __$$BookModelImplCopyWithImpl<_$BookModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookModelImplToJson(
      this,
    );
  }
}

abstract class _BookModel implements BookModel {
  const factory _BookModel(
      {@JsonKey(name: columnId) final int? id,
      @JsonKey(name: columnTitle) final String title,
      @JsonKey(name: columnPublisher) final String publisher,
      @JsonKey(name: columnAuthor) final String author,
      @JsonKey(name: columnYear) final num year,
      @JsonKey(name: columnPageCount) final num pageCount}) = _$BookModelImpl;

  factory _BookModel.fromJson(Map<String, dynamic> json) =
      _$BookModelImpl.fromJson;

  @override
  @JsonKey(name: columnId)
  int? get id;
  @override
  @JsonKey(name: columnTitle)
  String get title;
  @override
  @JsonKey(name: columnPublisher)
  String get publisher;
  @override
  @JsonKey(name: columnAuthor)
  String get author;
  @override
  @JsonKey(name: columnYear)
  num get year;
  @override
  @JsonKey(name: columnPageCount)
  num get pageCount;
  @override
  @JsonKey(ignore: true)
  _$$BookModelImplCopyWith<_$BookModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
