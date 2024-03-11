import 'package:flutter/material.dart';

Widget courseListView() {
  return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Card(
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
              trailing: Icon(Icons.more_vert),
            ),
          ),
        );
      });
}
