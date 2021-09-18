import 'package:dev_notes/controller/notes_controller.dart';
import 'package:get/get.dart';

class NotesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NotesController());
  }
}
