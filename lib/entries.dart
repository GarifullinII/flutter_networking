class EntriesList {
  List<Entry> entries;
  EntriesList({required this.entries});

  factory EntriesList.fromJson (Map<String, dynamic> json) {
    var EntriesJson = json['entries'] as List;

    List<Entry>entriesList = EntriesJson.map((i) => Entry.fromJson(i)).toList();

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
