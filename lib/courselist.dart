import 'package:flutter/material.dart';
import 'package:flutterclassroom/widget.dart';

class Courselist extends StatefulWidget {
  const Courselist({Key? key}) : super(key: key);

  @override
  _CourselistState createState() => _CourselistState();
}

class _CourselistState extends State<Courselist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Text("Flutter Classroom"),
        elevation: 5.0,
        shadowColor: Colors.grey,
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                print("avatar clicked");
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [courseListView()],
          ),
        ),
      ),
    );
  }
}
