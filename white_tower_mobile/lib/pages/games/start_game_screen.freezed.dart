// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_game_screen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CurrentAnswerResultState {

 bool get isShowMessage; AnswerResultMessageType get type; String get message;
/// Create a copy of CurrentAnswerResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentAnswerResultStateCopyWith<CurrentAnswerResultState> get copyWith => _$CurrentAnswerResultStateCopyWithImpl<CurrentAnswerResultState>(this as CurrentAnswerResultState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentAnswerResultState&&(identical(other.isShowMessage, isShowMessage) || other.isShowMessage == isShowMessage)&&(identical(other.type, type) || other.type == type)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,isShowMessage,type,message);

@override
String toString() {
  return 'CurrentAnswerResultState(isShowMessage: $isShowMessage, type: $type, message: $message)';
}


}

/// @nodoc
abstract mixin class $CurrentAnswerResultStateCopyWith<$Res>  {
  factory $CurrentAnswerResultStateCopyWith(CurrentAnswerResultState value, $Res Function(CurrentAnswerResultState) _then) = _$CurrentAnswerResultStateCopyWithImpl;
@useResult
$Res call({
 bool isShowMessage, AnswerResultMessageType type, String message
});




}
/// @nodoc
class _$CurrentAnswerResultStateCopyWithImpl<$Res>
    implements $CurrentAnswerResultStateCopyWith<$Res> {
  _$CurrentAnswerResultStateCopyWithImpl(this._self, this._then);

  final CurrentAnswerResultState _self;
  final $Res Function(CurrentAnswerResultState) _then;

/// Create a copy of CurrentAnswerResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isShowMessage = null,Object? type = null,Object? message = null,}) {
  return _then(_self.copyWith(
isShowMessage: null == isShowMessage ? _self.isShowMessage : isShowMessage // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnswerResultMessageType,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentAnswerResultState].
extension CurrentAnswerResultStatePatterns on CurrentAnswerResultState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentAnswerResultState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentAnswerResultState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentAnswerResultState value)  $default,){
final _that = this;
switch (_that) {
case _CurrentAnswerResultState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentAnswerResultState value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentAnswerResultState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isShowMessage,  AnswerResultMessageType type,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentAnswerResultState() when $default != null:
return $default(_that.isShowMessage,_that.type,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isShowMessage,  AnswerResultMessageType type,  String message)  $default,) {final _that = this;
switch (_that) {
case _CurrentAnswerResultState():
return $default(_that.isShowMessage,_that.type,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isShowMessage,  AnswerResultMessageType type,  String message)?  $default,) {final _that = this;
switch (_that) {
case _CurrentAnswerResultState() when $default != null:
return $default(_that.isShowMessage,_that.type,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _CurrentAnswerResultState implements CurrentAnswerResultState {
  const _CurrentAnswerResultState({required this.isShowMessage, required this.type, required this.message});
  

@override final  bool isShowMessage;
@override final  AnswerResultMessageType type;
@override final  String message;

/// Create a copy of CurrentAnswerResultState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentAnswerResultStateCopyWith<_CurrentAnswerResultState> get copyWith => __$CurrentAnswerResultStateCopyWithImpl<_CurrentAnswerResultState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentAnswerResultState&&(identical(other.isShowMessage, isShowMessage) || other.isShowMessage == isShowMessage)&&(identical(other.type, type) || other.type == type)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,isShowMessage,type,message);

@override
String toString() {
  return 'CurrentAnswerResultState(isShowMessage: $isShowMessage, type: $type, message: $message)';
}


}

/// @nodoc
abstract mixin class _$CurrentAnswerResultStateCopyWith<$Res> implements $CurrentAnswerResultStateCopyWith<$Res> {
  factory _$CurrentAnswerResultStateCopyWith(_CurrentAnswerResultState value, $Res Function(_CurrentAnswerResultState) _then) = __$CurrentAnswerResultStateCopyWithImpl;
@override @useResult
$Res call({
 bool isShowMessage, AnswerResultMessageType type, String message
});




}
/// @nodoc
class __$CurrentAnswerResultStateCopyWithImpl<$Res>
    implements _$CurrentAnswerResultStateCopyWith<$Res> {
  __$CurrentAnswerResultStateCopyWithImpl(this._self, this._then);

  final _CurrentAnswerResultState _self;
  final $Res Function(_CurrentAnswerResultState) _then;

/// Create a copy of CurrentAnswerResultState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isShowMessage = null,Object? type = null,Object? message = null,}) {
  return _then(_CurrentAnswerResultState(
isShowMessage: null == isShowMessage ? _self.isShowMessage : isShowMessage // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AnswerResultMessageType,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
