import 'package:dev_notes/controller/notes_controller.dart';
import 'package:dev_notes/routes/routes_constantes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewNoteView extends StatelessWidget {
  const NewNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notesController = Get.find<NotesController>();
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
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
                                  fontSize: 20,
                                  fontFamily: 'Baloo-SemiBold',
                                  color: Colors.white,
                                ),
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                                controller:
                                    notesController.newNotetitleController,
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
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                                maxLines: null,
                                controller:
                                    notesController.newNotebodyController,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 35),
                          primary: Colors.redAccent[400],
                        ),
                        onPressed: () async {
                          Get.offAllNamed(RoutesConstantes.kNotes);
                        },
                        child: Text(
                          'CANCELAR',
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
                          primary: Colors.greenAccent[400],
                        ),
                        onPressed: () async {
                          await notesController.addNote();
                        },
                        child: Text(
                          'SALVAR',
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
          ),
        ),
      ),
    );
  }
}
