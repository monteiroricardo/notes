import 'dart:convert';

class NewNoteViewModel {
  String title;
  String body;
  NewNoteViewModel({
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
    };
  }

  factory NewNoteViewModel.fromMap(Map<String, dynamic> map) {
    return NewNoteViewModel(
      title: map['title'],
      body: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NewNoteViewModel.fromJson(String source) =>
      NewNoteViewModel.fromMap(json.decode(source));
}
