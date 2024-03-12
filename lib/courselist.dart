import 'package:flutter/material.dart';
import 'package:flutterclassroom/coursedetails.dart';
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
        iconTheme: IconThemeData(color: Colors.white),
        toolbarHeight: 80,
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
      drawer: appDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12,
              ),
              courseListView()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          joinDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget courseListView() {
    return ListView.builder(
      itemCount: course,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Coursedetails(index: index)),
              );
            },
            child: Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black54, width: 1.0),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: SizedBox(
                height: 100,
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                  titleAlignment: ListTileTitleAlignment.titleHeight,
                  title: Text(
                    "Course Title",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    "Name of Instructor",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                            child: Text(
                              'Unenroll',
                              style: TextStyle(fontSize: 16),
                            ),
                            value: index),
                      ];
                    },
                    onSelected: (int index) {
                      unenrollDialog();
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void joinDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Join a Course'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                    labelText: "Course Code",
                    hintText: "Enter the course code..."),
              )
            ],
          ),
        );
      },
    );
  }

  void unenrollDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Icon(
            Icons.warning_rounded,
            color: Colors.red,
            size: 40,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Are you really sure you want to unenroll in this course?",
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      course -= 1;
                    });

                    final snackBar = SnackBar(
                      content: const Text('Unenrolled to course.'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          setState(() {
                            course += 1;
                          });
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text(
                    "Proceed",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
