import 'package:white_tower_mobile/net/http.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_service.g.dart';


@JsonSerializable()
class ChoiceQuestionModel {
  final int id;
  final List<String?> question;
  final List<String> options;
  final String answer;

  ChoiceQuestionModel({required this.question, required this.options, required this.answer, required this.id});

  
  factory ChoiceQuestionModel.fromJson(Map<String, dynamic> json) => _$ChoiceQuestionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChoiceQuestionModelToJson(this);
}