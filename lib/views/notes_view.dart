import 'package:dev_notes/controller/notes_controller.dart';
import 'package:dev_notes/exports/main_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NotesView extends GetView<NotesController> {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 170,
                    child: Image.asset(
                      'assets/images/node_logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontFamily: 'Baloo-Bold',
                        fontSize: 25,
                        color: Colors.black.withOpacity(
                          0.7,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 170,
                    child: Image.asset(
                      'assets/images/mysql_logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Text(
                      'with',
                      style: TextStyle(
                        fontFamily: 'Baloo-Bold',
                        fontSize: 25,
                        color: Colors.black.withOpacity(
                          0.7,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    child: Image.asset(
                      'assets/images/getx_logo.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontFamily: 'Baloo-Bold',
                        fontSize: 25,
                        color: Colors.black.withOpacity(
                          0.7,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    child: Image.asset(
                      'assets/images/flutter_logo.png',
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
              Wrap(
                children: controller.allNotes
                    .map(
                      (element) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            controller.setCurrentNote(element.id);
                            Get.toNamed(RoutesConstantes.kNote);
                          },
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Container(
                                width: 170,
                                height: 100,
                                child: Card(
                                  color: Colors.blueAccent,
                                  child: Center(
                                    child: Text(
                                      element.title,
                                      style: TextStyle(
                                        fontFamily: 'Baloo-SemiBold',
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -5,
                                child: Container(
                                  width: 70,
                                  height: 20,
                                  color:
                                      Colors.blueAccent[100]!.withOpacity(0.5),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RoutesConstantes.kNewNote);
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
