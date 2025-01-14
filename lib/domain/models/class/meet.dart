import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Meet {
  int id;
  String name;
  String translate;
  DateTime date;
  dynamic url;
  Meet({
    required this.id,
    required this.name,
    required this.translate,
    required this.date,
    required this.url,
  });

  factory Meet.empty() {
    return Meet(id: 0, name: '', translate: '', date: DateTime.now(), url: null);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'translate': translate,
      'date': date.millisecondsSinceEpoch,
      'url': url,
    };
  }

  factory Meet.fromMap(Map<String, dynamic> map) {
    return Meet(
      id: map['id'] as int,
      name: map['name'] as String,
      translate: map['translate'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      url: map['url'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meet.fromJson(String source) =>
      Meet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Meet(id: $id, name: $name, translate: $translate, date: $date, url: $url)';
  }
}
