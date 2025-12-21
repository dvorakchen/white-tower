// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameQuestionModel _$GameQuestionModelFromJson(
  Map<String, dynamic> json,
) => GameQuestionModel(
  question: json['question'] as String,
  options: (json['options'] as List<dynamic>).map((e) => e as String).toList(),
  answers: (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
  id: (json['id'] as num).toInt(),
  tableLevelId: (json['tableLevelId'] as num).toInt(),
  subjectId: (json['subjectId'] as num).toInt(),
  type: $enumDecode(_$GameQuestionTypeEnumMap, json['type']),
);

Map<String, dynamic> _$GameQuestionModelToJson(GameQuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tableLevelId': instance.tableLevelId,
      'subjectId': instance.subjectId,
      'type': _$GameQuestionTypeEnumMap[instance.type]!,
      'question': instance.question,
      'options': instance.options,
      'answers': instance.answers,
    };

const _$GameQuestionTypeEnumMap = {
  GameQuestionType.singleChoice: 'singleChoice',
  GameQuestionType.fillInBlank: 'fillInBlank',
};
