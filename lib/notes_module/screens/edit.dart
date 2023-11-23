import 'package:flutter/material.dart';


import 'package:stu_pedia/MainBottomNavigation.dart';


import 'package:stu_pedia/notes_module/hive/HiveClass.dart';


import '../models/note.dart';


class EditScreen extends StatefulWidget {

  final int? indeces;


  final Note? note;


  const EditScreen({super.key, this.note, this.indeces});


  @override

  State<EditScreen> createState() => _EditScreenState();

}


class _EditScreenState extends State<EditScreen> {

  TextEditingController _titleController = TextEditingController();


  TextEditingController _contentController = TextEditingController();


  int indeces = -1;


  int noteId = 0;


  @override

  void initState() {

    // TODO: implement initState


    if (widget.note != null) {

      _titleController = TextEditingController(text: widget.note!.title);


      _contentController = TextEditingController(text: widget.note!.content);


      noteId = widget.note!.id;

    }


    if (widget.indeces != null) {

      indeces = widget.indeces!;

    }


    super.initState();

  }


  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey[300],

      body: Padding(

        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),

        child: Column(children: [

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              IconButton(

                  onPressed: () {

                    Navigator.pop(context);

                  },

                  padding: const EdgeInsets.all(0),

                  icon: Container(

                    width: 40,

                    height: 40,

                    decoration: BoxDecoration(

                        color: Colors.teal,

                        borderRadius: BorderRadius.circular(10)),

                    child: const Icon(

                      Icons.arrow_back_ios_new,

                      color: Colors.black,

                    ),

                  ))

            ],

          ),

          Expanded(

              child: ListView(

            children: [

              TextField(

                controller: _titleController,

                style: const TextStyle(color: Colors.black, fontSize: 30),

                decoration: const InputDecoration(

                    border: InputBorder.none,

                    hintText: 'Title',

                    hintStyle: TextStyle(color: Colors.black54, fontSize: 30)),

              ),

              TextField(

                controller: _contentController,

                style: const TextStyle(

                  color: Colors.black54,

                ),

                maxLines: null,

                decoration: const InputDecoration(

                    border: InputBorder.none,

                    hintText: 'Type something here',

                    hintStyle: TextStyle(

                      color: Colors.black54,

                    )),

              ),

            ],

          ))

        ]),

      ),

      floatingActionButton: FloatingActionButton(

        onPressed: () {

          Note note = Note(

              id: noteId,

              title: _titleController.text,

              content: _contentController.text,

              modifiedTime: DateTime.now());


          if (indeces != -1) {

            Note.updateNotes(indeces, note);

            HiveClassNotes.updateNoteToHive(noteId, note.toMap());

          } else {

            HiveClassNotes.addNoteToHive(note.toMap());

          }


          Navigator.of(context).pushReplacement(MaterialPageRoute(

              builder: (context) => MainBottomNavigation(tabIndeces: 2)));

        },

        elevation: 10,

        backgroundColor: Colors.teal.shade400,

        child: const Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(

              Icons.save,

              color: Colors.white,

            ),

            Text(

              'Save',

              style: TextStyle(color: Colors.white),

            )

          ],

        ),

      ),

    );

  }

}

