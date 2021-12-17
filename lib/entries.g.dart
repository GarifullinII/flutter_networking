// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntriesList _$EntriesListFromJson(Map<String, dynamic> json) => EntriesList(
      entries: (json['entries'] as List<dynamic>)
          .map((e) => Entry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EntriesListToJson(EntriesList instance) =>
    <String, dynamic>{
      'entries': instance.entries,
    };

Entry _$EntryFromJson(Map<String, dynamic> json) => Entry(
      title: json['title'] as String?,
      key: json['key'] as String?,
      revision: json['revision'] as num?,
    );

Map<String, dynamic> _$EntryToJson(Entry instance) => <String, dynamic>{
      'title': instance.title,
      'key': instance.key,
      'revision': instance.revision,
    };
