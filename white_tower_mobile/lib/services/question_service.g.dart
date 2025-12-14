// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChoiceQuestionModel _$ChoiceQuestionModelFromJson(Map<String, dynamic> json) =>
    ChoiceQuestionModel(
      question: (json['question'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      options: (json['options'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      answer: json['answer'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$ChoiceQuestionModelToJson(
  ChoiceQuestionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'question': instance.question,
  'options': instance.options,
  'answer': instance.answer,
};
