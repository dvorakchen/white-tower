// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Pagination<T> {

 List<T> get list; int get currentPage; int get size; bool get isLoading; bool get hasMore;
/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationCopyWith<T, Pagination<T>> get copyWith => _$PaginationCopyWithImpl<T, Pagination<T>>(this as Pagination<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pagination<T>&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.size, size) || other.size == size)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),currentPage,size,isLoading,hasMore);

@override
String toString() {
  return 'Pagination<$T>(list: $list, currentPage: $currentPage, size: $size, isLoading: $isLoading, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $PaginationCopyWith<T,$Res>  {
  factory $PaginationCopyWith(Pagination<T> value, $Res Function(Pagination<T>) _then) = _$PaginationCopyWithImpl;
@useResult
$Res call({
 List<T> list, int currentPage, int size, bool isLoading, bool hasMore
});




}
/// @nodoc
class _$PaginationCopyWithImpl<T,$Res>
    implements $PaginationCopyWith<T, $Res> {
  _$PaginationCopyWithImpl(this._self, this._then);

  final Pagination<T> _self;
  final $Res Function(Pagination<T>) _then;

/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? currentPage = null,Object? size = null,Object? isLoading = null,Object? hasMore = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<T>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Pagination].
extension PaginationPatterns<T> on Pagination<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pagination<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pagination() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pagination<T> value)  $default,){
final _that = this;
switch (_that) {
case _Pagination():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pagination<T> value)?  $default,){
final _that = this;
switch (_that) {
case _Pagination() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> list,  int currentPage,  int size,  bool isLoading,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pagination() when $default != null:
return $default(_that.list,_that.currentPage,_that.size,_that.isLoading,_that.hasMore);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> list,  int currentPage,  int size,  bool isLoading,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _Pagination():
return $default(_that.list,_that.currentPage,_that.size,_that.isLoading,_that.hasMore);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> list,  int currentPage,  int size,  bool isLoading,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _Pagination() when $default != null:
return $default(_that.list,_that.currentPage,_that.size,_that.isLoading,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc


class _Pagination<T> implements Pagination<T> {
  const _Pagination({final  List<T> list = const [], this.currentPage = 0, this.size = 0, this.isLoading = false, this.hasMore = true}): _list = list;
  

 final  List<T> _list;
@override@JsonKey() List<T> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int size;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasMore;

/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationCopyWith<T, _Pagination<T>> get copyWith => __$PaginationCopyWithImpl<T, _Pagination<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pagination<T>&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.size, size) || other.size == size)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),currentPage,size,isLoading,hasMore);

@override
String toString() {
  return 'Pagination<$T>(list: $list, currentPage: $currentPage, size: $size, isLoading: $isLoading, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$PaginationCopyWith<T,$Res> implements $PaginationCopyWith<T, $Res> {
  factory _$PaginationCopyWith(_Pagination<T> value, $Res Function(_Pagination<T>) _then) = __$PaginationCopyWithImpl;
@override @useResult
$Res call({
 List<T> list, int currentPage, int size, bool isLoading, bool hasMore
});




}
/// @nodoc
class __$PaginationCopyWithImpl<T,$Res>
    implements _$PaginationCopyWith<T, $Res> {
  __$PaginationCopyWithImpl(this._self, this._then);

  final _Pagination<T> _self;
  final $Res Function(_Pagination<T>) _then;

/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? currentPage = null,Object? size = null,Object? isLoading = null,Object? hasMore = null,}) {
  return _then(_Pagination<T>(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<T>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
