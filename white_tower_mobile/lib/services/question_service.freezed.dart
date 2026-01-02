// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameQuestionModel {

/// 提问的问题
 String get question; Map<String, dynamic> get metadata;/// 对题目的解释分析
 String get explanation; int get id;/// 游戏关卡ID
 int get tableLevelId;/// 科目ID
 int get subjectId; GameQuestionType get type;
/// Create a copy of GameQuestionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameQuestionModelCopyWith<GameQuestionModel> get copyWith => _$GameQuestionModelCopyWithImpl<GameQuestionModel>(this as GameQuestionModel, _$identity);

  /// Serializes this GameQuestionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameQuestionModel&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.metadata, metadata)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.id, id) || other.id == id)&&(identical(other.tableLevelId, tableLevelId) || other.tableLevelId == tableLevelId)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,const DeepCollectionEquality().hash(metadata),explanation,id,tableLevelId,subjectId,type);

@override
String toString() {
  return 'GameQuestionModel(question: $question, metadata: $metadata, explanation: $explanation, id: $id, tableLevelId: $tableLevelId, subjectId: $subjectId, type: $type)';
}


}

/// @nodoc
abstract mixin class $GameQuestionModelCopyWith<$Res>  {
  factory $GameQuestionModelCopyWith(GameQuestionModel value, $Res Function(GameQuestionModel) _then) = _$GameQuestionModelCopyWithImpl;
@useResult
$Res call({
 String question, Map<String, dynamic> metadata, String explanation, int id, int tableLevelId, int subjectId, GameQuestionType type
});




}
/// @nodoc
class _$GameQuestionModelCopyWithImpl<$Res>
    implements $GameQuestionModelCopyWith<$Res> {
  _$GameQuestionModelCopyWithImpl(this._self, this._then);

  final GameQuestionModel _self;
  final $Res Function(GameQuestionModel) _then;

/// Create a copy of GameQuestionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? question = null,Object? metadata = null,Object? explanation = null,Object? id = null,Object? tableLevelId = null,Object? subjectId = null,Object? type = null,}) {
  return _then(_self.copyWith(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tableLevelId: null == tableLevelId ? _self.tableLevelId : tableLevelId // ignore: cast_nullable_to_non_nullable
as int,subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GameQuestionType,
  ));
}

}


/// Adds pattern-matching-related methods to [GameQuestionModel].
extension GameQuestionModelPatterns on GameQuestionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameQuestionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameQuestionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameQuestionModel value)  $default,){
final _that = this;
switch (_that) {
case _GameQuestionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameQuestionModel value)?  $default,){
final _that = this;
switch (_that) {
case _GameQuestionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String question,  Map<String, dynamic> metadata,  String explanation,  int id,  int tableLevelId,  int subjectId,  GameQuestionType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameQuestionModel() when $default != null:
return $default(_that.question,_that.metadata,_that.explanation,_that.id,_that.tableLevelId,_that.subjectId,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String question,  Map<String, dynamic> metadata,  String explanation,  int id,  int tableLevelId,  int subjectId,  GameQuestionType type)  $default,) {final _that = this;
switch (_that) {
case _GameQuestionModel():
return $default(_that.question,_that.metadata,_that.explanation,_that.id,_that.tableLevelId,_that.subjectId,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String question,  Map<String, dynamic> metadata,  String explanation,  int id,  int tableLevelId,  int subjectId,  GameQuestionType type)?  $default,) {final _that = this;
switch (_that) {
case _GameQuestionModel() when $default != null:
return $default(_that.question,_that.metadata,_that.explanation,_that.id,_that.tableLevelId,_that.subjectId,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameQuestionModel implements GameQuestionModel {
  const _GameQuestionModel({required this.question, required final  Map<String, dynamic> metadata, required this.explanation, required this.id, required this.tableLevelId, required this.subjectId, required this.type}): _metadata = metadata;
  factory _GameQuestionModel.fromJson(Map<String, dynamic> json) => _$GameQuestionModelFromJson(json);

/// 提问的问题
@override final  String question;
 final  Map<String, dynamic> _metadata;
@override Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}

/// 对题目的解释分析
@override final  String explanation;
@override final  int id;
/// 游戏关卡ID
@override final  int tableLevelId;
/// 科目ID
@override final  int subjectId;
@override final  GameQuestionType type;

/// Create a copy of GameQuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameQuestionModelCopyWith<_GameQuestionModel> get copyWith => __$GameQuestionModelCopyWithImpl<_GameQuestionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameQuestionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameQuestionModel&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other._metadata, _metadata)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.id, id) || other.id == id)&&(identical(other.tableLevelId, tableLevelId) || other.tableLevelId == tableLevelId)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,const DeepCollectionEquality().hash(_metadata),explanation,id,tableLevelId,subjectId,type);

@override
String toString() {
  return 'GameQuestionModel(question: $question, metadata: $metadata, explanation: $explanation, id: $id, tableLevelId: $tableLevelId, subjectId: $subjectId, type: $type)';
}


}

/// @nodoc
abstract mixin class _$GameQuestionModelCopyWith<$Res> implements $GameQuestionModelCopyWith<$Res> {
  factory _$GameQuestionModelCopyWith(_GameQuestionModel value, $Res Function(_GameQuestionModel) _then) = __$GameQuestionModelCopyWithImpl;
@override @useResult
$Res call({
 String question, Map<String, dynamic> metadata, String explanation, int id, int tableLevelId, int subjectId, GameQuestionType type
});




}
/// @nodoc
class __$GameQuestionModelCopyWithImpl<$Res>
    implements _$GameQuestionModelCopyWith<$Res> {
  __$GameQuestionModelCopyWithImpl(this._self, this._then);

  final _GameQuestionModel _self;
  final $Res Function(_GameQuestionModel) _then;

/// Create a copy of GameQuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? question = null,Object? metadata = null,Object? explanation = null,Object? id = null,Object? tableLevelId = null,Object? subjectId = null,Object? type = null,}) {
  return _then(_GameQuestionModel(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tableLevelId: null == tableLevelId ? _self.tableLevelId : tableLevelId // ignore: cast_nullable_to_non_nullable
as int,subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GameQuestionType,
  ));
}


}


/// @nodoc
mixin _$MetadataSingleChoice {

 List<String> get options; String get answer;
/// Create a copy of MetadataSingleChoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetadataSingleChoiceCopyWith<MetadataSingleChoice> get copyWith => _$MetadataSingleChoiceCopyWithImpl<MetadataSingleChoice>(this as MetadataSingleChoice, _$identity);

  /// Serializes this MetadataSingleChoice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetadataSingleChoice&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(options),answer);

@override
String toString() {
  return 'MetadataSingleChoice(options: $options, answer: $answer)';
}


}

/// @nodoc
abstract mixin class $MetadataSingleChoiceCopyWith<$Res>  {
  factory $MetadataSingleChoiceCopyWith(MetadataSingleChoice value, $Res Function(MetadataSingleChoice) _then) = _$MetadataSingleChoiceCopyWithImpl;
@useResult
$Res call({
 List<String> options, String answer
});




}
/// @nodoc
class _$MetadataSingleChoiceCopyWithImpl<$Res>
    implements $MetadataSingleChoiceCopyWith<$Res> {
  _$MetadataSingleChoiceCopyWithImpl(this._self, this._then);

  final MetadataSingleChoice _self;
  final $Res Function(MetadataSingleChoice) _then;

/// Create a copy of MetadataSingleChoice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? options = null,Object? answer = null,}) {
  return _then(_self.copyWith(
options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MetadataSingleChoice].
extension MetadataSingleChoicePatterns on MetadataSingleChoice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetadataSingleChoice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetadataSingleChoice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetadataSingleChoice value)  $default,){
final _that = this;
switch (_that) {
case _MetadataSingleChoice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetadataSingleChoice value)?  $default,){
final _that = this;
switch (_that) {
case _MetadataSingleChoice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> options,  String answer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetadataSingleChoice() when $default != null:
return $default(_that.options,_that.answer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> options,  String answer)  $default,) {final _that = this;
switch (_that) {
case _MetadataSingleChoice():
return $default(_that.options,_that.answer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> options,  String answer)?  $default,) {final _that = this;
switch (_that) {
case _MetadataSingleChoice() when $default != null:
return $default(_that.options,_that.answer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetadataSingleChoice implements MetadataSingleChoice {
  const _MetadataSingleChoice({final  List<String> options = const [], this.answer = ''}): _options = options;
  factory _MetadataSingleChoice.fromJson(Map<String, dynamic> json) => _$MetadataSingleChoiceFromJson(json);

 final  List<String> _options;
@override@JsonKey() List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override@JsonKey() final  String answer;

/// Create a copy of MetadataSingleChoice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetadataSingleChoiceCopyWith<_MetadataSingleChoice> get copyWith => __$MetadataSingleChoiceCopyWithImpl<_MetadataSingleChoice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetadataSingleChoiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetadataSingleChoice&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_options),answer);

@override
String toString() {
  return 'MetadataSingleChoice(options: $options, answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$MetadataSingleChoiceCopyWith<$Res> implements $MetadataSingleChoiceCopyWith<$Res> {
  factory _$MetadataSingleChoiceCopyWith(_MetadataSingleChoice value, $Res Function(_MetadataSingleChoice) _then) = __$MetadataSingleChoiceCopyWithImpl;
@override @useResult
$Res call({
 List<String> options, String answer
});




}
/// @nodoc
class __$MetadataSingleChoiceCopyWithImpl<$Res>
    implements _$MetadataSingleChoiceCopyWith<$Res> {
  __$MetadataSingleChoiceCopyWithImpl(this._self, this._then);

  final _MetadataSingleChoice _self;
  final $Res Function(_MetadataSingleChoice) _then;

/// Create a copy of MetadataSingleChoice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? options = null,Object? answer = null,}) {
  return _then(_MetadataSingleChoice(
options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
