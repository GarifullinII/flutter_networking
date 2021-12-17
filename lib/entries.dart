import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'entries.g.dart';

@JsonSerializable()
class EntriesList {
  List<Entry> entries;
  EntriesList({required this.entries});

  factory EntriesList.fromJson(Map<String, dynamic> json) =>
      _$EntriesListFromJson(json);

  Map<String, dynamic> toJson() => _$EntriesListToJson(this);
}

@JsonSerializable()
class Entry {
  final String? title;
  final String? key;
  final num? revision;

  Entry({this.title, this.key, this.revision});

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  Map<String, dynamic> toJson() => _$EntryToJson(this);
}

Future<EntriesList> getEntriesList() async {
  const url = 'https://openlibrary.org/authors/OL23919A/works.json';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return EntriesList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
