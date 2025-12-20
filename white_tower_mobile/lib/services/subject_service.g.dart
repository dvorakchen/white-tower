// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  subtitle: json['subtitle'] as String,
  iconLink: json['iconLink'] as String,
);

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'iconLink': instance.iconLink,
};

TableOfSubject _$TableOfSubjectFromJson(Map<String, dynamic> json) =>
    TableOfSubject(
      subjectId: (json['subjectId'] as num).toInt(),
      tableLevel: (json['tableLevel'] as List<dynamic>)
          .map((e) => TableLevel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TableOfSubjectToJson(TableOfSubject instance) =>
    <String, dynamic>{
      'subjectId': instance.subjectId,
      'tableLevel': instance.tableLevel,
    };

TableLevel _$TableLevelFromJson(Map<String, dynamic> json) => TableLevel(
  id: (json['id'] as num).toInt(),
  subjectId: (json['subjectId'] as num).toInt(),
  title: json['title'] as String,
  parentId: (json['parentId'] as num?)?.toInt(),
  type: json['type'] as String,
  orderInParent: (json['orderInParent'] as num).toInt(),
  isUsed: json['isUsed'] as bool? ?? true,
  isValid: json['isValid'] as bool? ?? true,
  children:
      (json['children'] as List<dynamic>?)
          ?.map((e) => TableLevel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$TableLevelToJson(TableLevel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subjectId': instance.subjectId,
      'title': instance.title,
      'parentId': instance.parentId,
      'type': instance.type,
      'orderInParent': instance.orderInParent,
      'isUsed': instance.isUsed,
      'isValid': instance.isValid,
      'children': instance.children,
    };
