import 'package:flutter/material.dart';
import 'package:flutterclassroom/coursedetails.dart';
import 'package:flutterclassroom/courselist.dart';
import 'package:flutterclassroom/main.dart';

int course = 10;

Widget appDrawer(BuildContext context) {
  return Drawer(
    child: SingleChildScrollView(
      child: Column(
        children: [
          DrawerHeader(
            child: Text(
              "Flutter\nClassroom",
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Courses"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Courselist()),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "ENROLLED COURSES",
            style: TextStyle(fontWeight: FontWeight.w200, color: Colors.grey),
          ),
          drawerMenuListView(),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Sign Out"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
        ],
      ),
    ),
  );
}

Widget drawerMenuListView() {
  return ListView.builder(
      itemCount: course,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("Course Title"),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Coursedetails(index: index)),
            );
          },
        );
      });
}
