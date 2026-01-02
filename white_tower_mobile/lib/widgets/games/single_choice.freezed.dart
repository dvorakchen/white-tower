// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_choice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SingleChoiceState {

 GameQuestionModel get model; MetadataSingleChoice get metadata; OnSelectCb? get onSelect;
/// Create a copy of SingleChoiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SingleChoiceStateCopyWith<SingleChoiceState> get copyWith => _$SingleChoiceStateCopyWithImpl<SingleChoiceState>(this as SingleChoiceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingleChoiceState&&(identical(other.model, model) || other.model == model)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.onSelect, onSelect) || other.onSelect == onSelect));
}


@override
int get hashCode => Object.hash(runtimeType,model,metadata,onSelect);

@override
String toString() {
  return 'SingleChoiceState(model: $model, metadata: $metadata, onSelect: $onSelect)';
}


}

/// @nodoc
abstract mixin class $SingleChoiceStateCopyWith<$Res>  {
  factory $SingleChoiceStateCopyWith(SingleChoiceState value, $Res Function(SingleChoiceState) _then) = _$SingleChoiceStateCopyWithImpl;
@useResult
$Res call({
 GameQuestionModel model, MetadataSingleChoice metadata, OnSelectCb? onSelect
});


$GameQuestionModelCopyWith<$Res> get model;$MetadataSingleChoiceCopyWith<$Res> get metadata;

}
/// @nodoc
class _$SingleChoiceStateCopyWithImpl<$Res>
    implements $SingleChoiceStateCopyWith<$Res> {
  _$SingleChoiceStateCopyWithImpl(this._self, this._then);

  final SingleChoiceState _self;
  final $Res Function(SingleChoiceState) _then;

/// Create a copy of SingleChoiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? metadata = null,Object? onSelect = freezed,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as GameQuestionModel,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetadataSingleChoice,onSelect: freezed == onSelect ? _self.onSelect : onSelect // ignore: cast_nullable_to_non_nullable
as OnSelectCb?,
  ));
}
/// Create a copy of SingleChoiceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameQuestionModelCopyWith<$Res> get model {
  
  return $GameQuestionModelCopyWith<$Res>(_self.model, (value) {
    return _then(_self.copyWith(model: value));
  });
}/// Create a copy of SingleChoiceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataSingleChoiceCopyWith<$Res> get metadata {
  
  return $MetadataSingleChoiceCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [SingleChoiceState].
extension SingleChoiceStatePatterns on SingleChoiceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SingleChoiceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SingleChoiceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SingleChoiceState value)  $default,){
final _that = this;
switch (_that) {
case _SingleChoiceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SingleChoiceState value)?  $default,){
final _that = this;
switch (_that) {
case _SingleChoiceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GameQuestionModel model,  MetadataSingleChoice metadata,  OnSelectCb? onSelect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SingleChoiceState() when $default != null:
return $default(_that.model,_that.metadata,_that.onSelect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GameQuestionModel model,  MetadataSingleChoice metadata,  OnSelectCb? onSelect)  $default,) {final _that = this;
switch (_that) {
case _SingleChoiceState():
return $default(_that.model,_that.metadata,_that.onSelect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GameQuestionModel model,  MetadataSingleChoice metadata,  OnSelectCb? onSelect)?  $default,) {final _that = this;
switch (_that) {
case _SingleChoiceState() when $default != null:
return $default(_that.model,_that.metadata,_that.onSelect);case _:
  return null;

}
}

}

/// @nodoc


class _SingleChoiceState implements SingleChoiceState {
   _SingleChoiceState({this.model = const GameQuestionModel(question: '', metadata: {}, explanation: '', id: 0, tableLevelId: 0, subjectId: 0, type: .singleChoice), this.metadata = const MetadataSingleChoice(), this.onSelect});
  

@override@JsonKey() final  GameQuestionModel model;
@override@JsonKey() final  MetadataSingleChoice metadata;
@override final  OnSelectCb? onSelect;

/// Create a copy of SingleChoiceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SingleChoiceStateCopyWith<_SingleChoiceState> get copyWith => __$SingleChoiceStateCopyWithImpl<_SingleChoiceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SingleChoiceState&&(identical(other.model, model) || other.model == model)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.onSelect, onSelect) || other.onSelect == onSelect));
}


@override
int get hashCode => Object.hash(runtimeType,model,metadata,onSelect);

@override
String toString() {
  return 'SingleChoiceState(model: $model, metadata: $metadata, onSelect: $onSelect)';
}


}

/// @nodoc
abstract mixin class _$SingleChoiceStateCopyWith<$Res> implements $SingleChoiceStateCopyWith<$Res> {
  factory _$SingleChoiceStateCopyWith(_SingleChoiceState value, $Res Function(_SingleChoiceState) _then) = __$SingleChoiceStateCopyWithImpl;
@override @useResult
$Res call({
 GameQuestionModel model, MetadataSingleChoice metadata, OnSelectCb? onSelect
});


@override $GameQuestionModelCopyWith<$Res> get model;@override $MetadataSingleChoiceCopyWith<$Res> get metadata;

}
/// @nodoc
class __$SingleChoiceStateCopyWithImpl<$Res>
    implements _$SingleChoiceStateCopyWith<$Res> {
  __$SingleChoiceStateCopyWithImpl(this._self, this._then);

  final _SingleChoiceState _self;
  final $Res Function(_SingleChoiceState) _then;

/// Create a copy of SingleChoiceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? metadata = null,Object? onSelect = freezed,}) {
  return _then(_SingleChoiceState(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as GameQuestionModel,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetadataSingleChoice,onSelect: freezed == onSelect ? _self.onSelect : onSelect // ignore: cast_nullable_to_non_nullable
as OnSelectCb?,
  ));
}

/// Create a copy of SingleChoiceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameQuestionModelCopyWith<$Res> get model {
  
  return $GameQuestionModelCopyWith<$Res>(_self.model, (value) {
    return _then(_self.copyWith(model: value));
  });
}/// Create a copy of SingleChoiceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataSingleChoiceCopyWith<$Res> get metadata {
  
  return $MetadataSingleChoiceCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
