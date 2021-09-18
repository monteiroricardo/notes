import 'package:dev_notes/models/note_model.dart';
import 'package:dev_notes/models/preview_note_model.dart';
import 'package:dev_notes/view_models/new_note_viewmodel.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio dio = Dio();

  Future<List<PreviewNoteModel>> findAllNotes() async {
    Response<dynamic> result = await dio.get(
      'http://localhost:3000/api/notes',
    );
    List<PreviewNoteModel> notes = [];
    Map<String, dynamic> res = result.data;

    for (var item in res['result']) {
      notes.add(PreviewNoteModel.fromMap(item));
    }
    return notes;
  }

  Future<NoteModel> findOnlyNote(int id) async {
    Response<dynamic> result = await dio.get(
      'http://localhost:3000/api/note/$id',
    );
    return NoteModel.fromMap(result.data['result']);
  }

  Future<bool> updateNote(NoteModel noteModel) async {
    Response<dynamic> result = await dio.put(
      "http://localhost:3000/api/note/${noteModel.id}",
      data: {
        'title': noteModel.title,
        'content': noteModel.body,
      },
    );
    if (result.data['status'] == 'success') {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> addNote(NewNoteViewModel noteModel) async {
    Response<dynamic> result = await dio.post(
      "http://localhost:3000/api/new",
      data: {
        'title': noteModel.title,
        'content': noteModel.body,
      },
    );

    if (result.data['status'] == 'success') {
      return true;
    } else {
      return false;
    }
  }

  Future<void> deleteNote(int id) async {
    Response<dynamic> result = await dio.delete(
      "http://localhost:3000/api/note/$id",
    );
    print(result.data);
  }
}
