import 'package:white_tower_mobile/models/pagination.dart';
import 'package:white_tower_mobile/net/http.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_service.g.dart';

@JsonSerializable()
class Subject {
  final int id;
  final String title;
  final String subtitle;
  final String iconLink;

  Subject({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.iconLink,
  });

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

@JsonSerializable()
class TableOfSubject {
  final int subjectId;
  final List<TableLevel> tableLevel;

  TableOfSubject({required this.subjectId, required this.tableLevel});

  factory TableOfSubject.fromJson(Map<String, dynamic> json) =>
      _$TableOfSubjectFromJson(json);
  Map<String, dynamic> toJson() => _$TableOfSubjectToJson(this);
}

@JsonSerializable()
class TableLevel {
  final int id;
  final String title;
  final int? parentId;
  final String type;
  final int orderInParent;
  final List<TableLevel> children;

  TableLevel({
    required this.id,
    required this.title,
    required this.parentId,
    required this.type,
    required this.orderInParent,
    this.children = const [],
  });

  factory TableLevel.fromJson(Map<String, dynamic> json) =>
      _$TableLevelFromJson(json);
  Map<String, dynamic> toJson() => _$TableLevelToJson(this);
}

abstract interface class SubjectService {
  Future<Pagination<Subject>> fetchSubjects({
    int? start,
    int? count,
    String? title,
  });

  Future<Pagination<TableLevel>> fetchTableOfSubjectBySubjectId(
    int subjectId,
    int start,
    int count,
  );
}

class MedicineSubject implements SubjectService {
  final Http _http;
  MedicineSubject(this._http);

  @override
  Future<Pagination<Subject>> fetchSubjects({
    int? start,
    int? count,
    String? title,
  }) async {
    // var data = await _http.get('path', Subject.fromJson );

    await Future.delayed(Duration(seconds: 2));

    return Pagination(
      list: [
        Subject(
          id: 0,
          title: '内科学',
          subtitle: '涵盖循环、呼吸、消化、泌尿系统',
          iconLink:
              'https://images.icon-icons.com/2257/PNG/512/stethoscope_doctor_health_medical_healthcare_icon_140241.png',
        ),
        Subject(
          id: 1,
          title: '药理学',
          subtitle: '涵盖药物代谢、作用机制、临床应用与不良反应',
          iconLink:
              'https://images.icon-icons.com/2313/PNG/512/pills_pill_bottle_medicine_medical_healthcare_icon_141993.png',
        ),

        Subject(
          id: 2,
          title: '诊断学',
          subtitle: '涵盖症状学、体格检查、实验室诊断与影像学',
          iconLink:
              'https://images.icon-icons.com/3802/PNG/512/x_ray_bone_scan_radiography_medical_icon_233051.png',
        ),
      ],
      currentPage: 1,
      isLoading: false,
      hasMore: true,
    );
  }

  @override
  Future<Pagination<TableLevel>> fetchTableOfSubjectBySubjectId(
    int subjectId,
    int start,
    int count,
  ) async {
    // var data = await _http.get('path', Subject.fromJson );

    await Future.delayed(Duration(milliseconds: 1000));

    // 顶级目录 (Chapter)
    final rootLevels = [
      TableLevel(
        id: 201,
        parentId: 200,
        type: 'Section',
        orderInParent: 2,
        title: '急性上呼吸道感染 ',
        children: [
          TableLevel(
            id: 202,
            parentId: 201,
            type: 'Appendix',
            orderInParent: 1,
            title: '流行性感冒',
          ),
        ],
      ),
      TableLevel(
        id: 203,
        parentId: 200,
        type: 'Section',
        orderInParent: 1,
        title: '慢性支气管炎',
      ),
      TableLevel(
        id: 204,
        parentId: 200,
        type: 'Section',
        orderInParent: 1,
        title: '急性气管支气管炎',
      ),
      TableLevel(
        id: 205,
        parentId: 200,
        type: 'Section',
        orderInParent: 1,
        title: '慢性阻塞性肺疾病',
      ),
      TableLevel(
        id: 206,
        parentId: 200,
        type: 'Chapter',
        orderInParent: 1,
        title: '支气管哮喘',
      ),
      TableLevel(
        id: 207,
        parentId: 200,
        type: 'Chapter',
        orderInParent: 1,
        title: '支气管扩张症',
      ),
      TableLevel(
        id: 208,
        parentId: 200,
        type: 'Section',
        orderInParent: 1,
        title: '肺炎概述',
      ),
      TableLevel(
        id: 209,
        parentId: 200,
        type: 'Section',
        orderInParent: 1,
        title: '细菌性肺炎',
      ),
      TableLevel(
        id: 210,
        parentId: 200,
        type: 'Section',
        orderInParent: 1,
        title: ' 肺炎链球菌肺炎',
      ),
    ];

    // 返回 TableOfSubject 对象
    return Pagination(
      list: rootLevels,
      currentPage: 1,
      isLoading: false,
      hasMore: true,
    );
  }
}
