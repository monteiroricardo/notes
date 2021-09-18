import 'package:dev_notes/models/note_model.dart';
import 'package:dev_notes/models/preview_note_model.dart';
import 'package:dev_notes/view_models/new_note_viewmodel.dart';

import '../provider/api_provider.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<PreviewNoteModel>> findAllNotes() async {
    return await _apiProvider.findAllNotes();
  }

  Future<NoteModel> findOnlyNote(int id) async {
    return await _apiProvider.findOnlyNote(id);
  }

  Future<bool> updateNote(NoteModel noteModel) async {
    return await _apiProvider.updateNote(noteModel);
  }

  Future<void> deleteNote(int id) async {
    return await _apiProvider.deleteNote(id);
  }

  Future<bool> addNote(NewNoteViewModel noteModel) async {
    return await _apiProvider.addNote(noteModel);
  }
}
