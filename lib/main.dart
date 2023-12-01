import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(49, 49, 131, 1)),
        useMaterial3: true,
      ),
      home: const CoursesList(title: 'Student Index 203235'),
    );
  }
}

class CoursesList extends StatefulWidget {
  final String title;

  const CoursesList({super.key, required this.title});

  @override
  State<CoursesList> createState() {
    return _CoursesListState();
  }
}

class _CoursesListState extends State<CoursesList> {
  final List<String> _courses = [];

  void addCourse() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newCourse = "";
          return AlertDialog(
            title: const Text("Add a new Course"),
            content: TextField(
              autofocus: true,
              onChanged: (value) {
                newCourse = value;
              },
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (newCourse.isNotEmpty) {
                        _courses.add(newCourse);
                      }
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("Add"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(42, 147, 209, 1),
            titleTextStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        body: Container(
          color: const Color.fromRGBO(49, 49, 131, 1),
          child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
              itemCount: _courses.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_courses[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_forever_rounded),
                      onPressed: () {
                        setState(() {
                          _courses.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: addCourse,
            backgroundColor: const Color.fromRGBO(42, 147, 209, 1),
            // make the icon white
            child: const IconTheme(
              data: IconThemeData(color: Colors.white),
              child: Icon(Icons.add),
            )));
  }
}
