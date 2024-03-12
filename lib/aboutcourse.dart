import 'package:flutter/material.dart';

class Aboutcourse extends StatefulWidget {
  const Aboutcourse({Key? key}) : super(key: key);

  @override
  _AboutcourseState createState() => _AboutcourseState();
}

class _AboutcourseState extends State<Aboutcourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("About"),
          toolbarHeight: 80,
          elevation: 5.0,
          shadowColor: Colors.grey,
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Course",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100),
                child: Divider(),
              ),
              Text(
                "Course Name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Course Code",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100),
                child: Divider(),
              ),
              Text(
                "Code Name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Instructor",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100),
                child: Divider(),
              ),
              Text(
                "Instructor Name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ));
  }
}
