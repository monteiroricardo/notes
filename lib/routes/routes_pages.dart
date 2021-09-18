import 'package:dev_notes/bindings/notes_binding.dart';
import 'package:dev_notes/exports/main_exports.dart';
import 'package:dev_notes/views/new_note_view.dart';
import 'package:dev_notes/views/note_detail_view.dart';
import 'package:dev_notes/views/notes_view.dart';
import 'package:get/get.dart';

class RoutesPages {
  static List<GetPage> paths = [
    GetPage(
      name: RoutesConstantes.kNotes,
      page: () => NotesView(),
      binding: NotesBinding(),
    ),
    GetPage(
      name: RoutesConstantes.kNote,
      page: () => NoteDetailView(),
    ),
    GetPage(
      name: RoutesConstantes.kNewNote,
      page: () => NewNoteView(),
    )
  ];
}
