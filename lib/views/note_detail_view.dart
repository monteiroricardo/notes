import 'package:dev_notes/controller/notes_controller.dart';
import 'package:dev_notes/exports/main_exports.dart';
import 'package:dev_notes/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class NoteDetailView extends StatefulWidget {
  const NoteDetailView({Key? key}) : super(key: key);

  @override
  _NoteDetailViewState createState() => _NoteDetailViewState();
}

class _NoteDetailViewState extends State<NoteDetailView> {
  @override
  Widget build(BuildContext context) {
    final notesController = Get.find<NotesController>();
    return Scaffold(
      body: Container(
          child: Center(
        child: FutureBuilder(
          future: notesController.getCurrentNote(),
          builder: (
            _,
            AsyncSnapshot<NoteModel> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        margin: EdgeInsets.all(
                          10,
                        ),
                        width: (MediaQuery.of(context).size.width * 60) / 100,
                        height: (MediaQuery.of(context).size.height * 70) / 100,
                        child: Card(
                          elevation: 5,
                          color: Colors.blueAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Container(
                                  child: TextField(
                                    cursorColor: Colors.white,
                                    style: TextStyle(
                                      fontFamily: 'Baloo-SemiBold',
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                    controller: notesController.titleController,
                                  ),
                                ),
                                Divider(),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(
                                      fontFamily: 'Baloo-SemiBold',
                                      color: Colors.white,
                                    ),
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                    maxLines: null,
                                    controller: notesController.bodyController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -10,
                        child: Container(
                          width: (MediaQuery.of(context).size.width * 12) / 100,
                          height: 40,
                          color: Colors.blueAccent[100]!.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width * 60) / 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(100, 35),
                              primary: Colors.blueAccent[400],
                            ),
                            onPressed: () async {
                              Get.offAllNamed(RoutesConstantes.kNotes);
                            },
                            child: Text(
                              'VOLTAR',
                              style: TextStyle(
                                fontFamily: 'Baloo-SemiBold',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(100, 35),
                              primary: Colors.greenAccent[400],
                            ),
                            onPressed: () async {
                              await notesController.updateNote();
                            },
                            child: Text(
                              'ATUALIZAR',
                              style: TextStyle(
                                fontFamily: 'Baloo-SemiBold',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(100, 35),
                              primary: Colors.redAccent[400],
                            ),
                            onPressed: () async {
                              await notesController.deleteNote();
                              Get.offAllNamed(RoutesConstantes.kNotes);
                            },
                            child: Text(
                              'DELETAR',
                              style: TextStyle(
                                fontFamily: 'Baloo-SemiBold',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Text(
                'FATAL ERROR',
              );
            }
          },
        ),
      )),
    );
  }
}
