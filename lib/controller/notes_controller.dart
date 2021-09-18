import 'package:dev_notes/models/note_model.dart';
import 'package:dev_notes/models/preview_note_model.dart';
import 'package:dev_notes/repositories/api_repository.dart';
import 'package:dev_notes/routes/routes_constantes.dart';
import 'package:dev_notes/view_models/new_note_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesController extends GetxController {
  final ApiRepository apiRepository = ApiRepository();

  final bodyController = TextEditingController();
  final titleController = TextEditingController();
  final newNotebodyController = TextEditingController();
  final newNotetitleController = TextEditingController();

  final allNotes = <PreviewNoteModel>[].obs;

  final currentNote = 0.obs;

  void setCurrentNote(int index) {
    currentNote.value = index;
  }

  Future<NoteModel> getCurrentNote() async {
    NoteModel noteModel = await apiRepository.findOnlyNote(currentNote.value);
    titleController.text = noteModel.title;
    bodyController.text = noteModel.body;
    return noteModel;
  }

  Future<void> updateNote() async {
    bool status = await apiRepository.updateNote(
      NoteModel(
        id: currentNote.value,
        title: titleController.text,
        body: bodyController.text,
      ),
    );

    if (status) {
      await refresh();
      Get.offAndToNamed(RoutesConstantes.kNotes);
      Get.snackbar(
        '',
        '',
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 0.0,
        backgroundColor: Color(0xff3fd18a),
        colorText: Colors.white,
        titleText: Text(
          'SUCESSO',
          style: TextStyle(
            fontFamily: 'Baloo-SemiBold',
            color: Colors.white,
          ),
        ),
        messageText: Text(
          'NOTA ATUALIZADA COM SUCESSO',
          style: TextStyle(
            fontFamily: 'Baloo-SemiBold',
            color: Colors.white,
          ),
        ),
      );
    } else {
      Get.snackbar(
        '',
        '',
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 0.0,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        titleText: Text(
          'ERRO',
          style: TextStyle(
            fontFamily: 'Baloo-SemiBold',
            color: Colors.white,
          ),
        ),
        messageText: Text(
          'HOUVE UM ERRO AO ATUALIZAR A NOTA',
          style: TextStyle(
            fontFamily: 'Baloo-SemiBold',
            color: Colors.white,
          ),
        ),
      );
    }
  }

  Future<void> deleteNote() async {
    await apiRepository.deleteNote(currentNote.value);
  }

  Future<void> refresh() async {
    allNotes.value = await apiRepository.findAllNotes();
  }

  Future<void> addNote() async {
    bool status = await apiRepository.addNote(
      NewNoteViewModel(
        title: newNotetitleController.text,
        body: newNotebodyController.text,
      ),
    );
    if (status) {
      await refresh();
      Get.offAndToNamed(RoutesConstantes.kNotes);
      Get.snackbar(
        '',
        '',
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 0.0,
        backgroundColor: Color(0xff3fd18a),
        colorText: Colors.white,
        titleText: Text(
          'SUCESSO',
          style: TextStyle(
            fontFamily: 'Baloo-SemiBold',
            color: Colors.white,
          ),
        ),
        messageText: Text(
          'NOTA CRIADA COM SUCESSO',
          style: TextStyle(
            fontFamily: 'Baloo-SemiBold',
            color: Colors.white,
          ),
        ),
      );
    } else {
      Get.snackbar(
        '',
        '',
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 0.0,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        titleText: Text(
          'ERRO',
          style: TextStyle(
            fontFamily: 'Baloo-SemiBold',
            color: Colors.white,
          ),
        ),
        messageText: Text(
          'HOUVE UM ERRO AO CRIAR A NOTA',
          style: TextStyle(
            fontFamily: 'Baloo-SemiBold',
            color: Colors.white,
          ),
        ),
      );
    }
  }

  @override
  void onInit() async {
    await refresh();
    super.onInit();
  }
}
