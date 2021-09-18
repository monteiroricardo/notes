import 'dart:convert';

class PreviewNoteModel {
  int id;
  String title;
  PreviewNoteModel({
    required this.id,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory PreviewNoteModel.fromMap(Map<String, dynamic> map) {
    return PreviewNoteModel(
      id: map['id'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PreviewNoteModel.fromJson(String source) =>
      PreviewNoteModel.fromMap(json.decode(source));
}
