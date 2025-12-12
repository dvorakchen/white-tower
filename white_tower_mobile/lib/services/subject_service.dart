import 'package:white_tower_mobile/net/http.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_service.g.dart';

@JsonSerializable()
class Subject {
  final int id;
  final String title;
  final String subtitle;

  Subject({required this.id, required this.title, required this.subtitle});

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

abstract interface class SubjectService {
  Future<List<Subject>> fetchSubjects({int? start, int? count, String? title});
}

class MedicineSubject implements SubjectService {
  final Http _http;
  MedicineSubject(this._http);

  @override
  Future<List<Subject>> fetchSubjects({
    int? start,
    int? count,
    String? title,
  }) async {
    // final resp = _http.get('path', (json) {});

    // var data = await _http.get('path', Subject.fromJson );

    
    await Future.delayed(Duration(seconds: 2));
    final list = List.generate(
      3,
      (index) =>
          Subject(id: index, title: '内科学$index', subtitle: '涵盖循环、呼吸、消化、泌尿系统'),
    );

    return list;
  }
}
