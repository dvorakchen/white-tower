import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';

@freezed
abstract class Pagination<T> with _$Pagination<T> {
  const factory Pagination({
    @Default([]) List<T> list,
    @Default(0) int currentPage,
    @Default(0) int size,
    @Default(false) bool isLoading,
    @Default(true) bool hasMore,
  }) = _Pagination;

  factory Pagination.empty() => Pagination<T>(
    list: const [],
    currentPage: 0,
    size: 0,
    isLoading: false,
    hasMore: true,
  );
}
