// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameQuestionModel _$GameQuestionModelFromJson(Map<String, dynamic> json) =>
    _GameQuestionModel(
      question: json['question'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
      explanation: json['explanation'] as String,
      id: (json['id'] as num).toInt(),
      tableLevelId: (json['tableLevelId'] as num).toInt(),
      subjectId: (json['subjectId'] as num).toInt(),
      type: $enumDecode(_$GameQuestionTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$GameQuestionModelToJson(_GameQuestionModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'metadata': instance.metadata,
      'explanation': instance.explanation,
      'id': instance.id,
      'tableLevelId': instance.tableLevelId,
      'subjectId': instance.subjectId,
      'type': _$GameQuestionTypeEnumMap[instance.type]!,
    };

const _$GameQuestionTypeEnumMap = {
  GameQuestionType.singleChoice: 'singleChoice',
  GameQuestionType.fillInBlank: 'fillInBlank',
};

_MetadataSingleChoice _$MetadataSingleChoiceFromJson(
  Map<String, dynamic> json,
) => _MetadataSingleChoice(
  options:
      (json['options'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  answer: json['answer'] as String? ?? '',
);

Map<String, dynamic> _$MetadataSingleChoiceToJson(
  _MetadataSingleChoice instance,
) => <String, dynamic>{'options': instance.options, 'answer': instance.answer};
