import 'dart:convert';

import 'package:http/http.dart' as http;

class EntriesList {
  List<Entry> entries;
  EntriesList({required this.entries});

  factory EntriesList.fromJson(Map<String, dynamic> json) {
    var EntriesJson = json['entries'] as List;

    List<Entry> entriesList =
        EntriesJson.map((i) => Entry.fromJson(i)).toList();

    return EntriesList(entries: entriesList);
  }
}

class Entry {
  final String? title;
  final String? key;
  final num? revision;

  Entry({this.title, this.key, this.revision});

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
        title: json['title'] as String,
        key: json['key'] as String,
        revision: json['revision'] as num);
  }
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
