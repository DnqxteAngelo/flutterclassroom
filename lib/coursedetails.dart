import 'package:flutter/material.dart';
import 'package:flutterclassroom/aboutcourse.dart';
import 'package:flutterclassroom/widget.dart';

class Coursedetails extends StatefulWidget {
  final int index;

  const Coursedetails({Key? key, required this.index}) : super(key: key);

  @override
  _CoursedetailsState createState() => _CoursedetailsState();
}

class _CoursedetailsState extends State<Coursedetails> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (_selectedIndex == 0) {
      body = Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 16,
              ),
              lessonListView()
            ],
          ),
        ),
      );
    } else {
      body = Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                "Instructor",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text(
                    "I",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                title: Text("Instructor Name"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Students",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(),
              ),
              peopleListView()
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        toolbarHeight: 80,
        title: Text("Course ${widget.index}"),
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
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Aboutcourse()),
                    );
                  },
                  icon: Icon(Icons.info)))
        ],
      ),
      drawer: appDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: body,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Lessons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'People',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget lessonListView() {
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
                  leading: Icon(
                    Icons.library_books,
                    color: Colors.black,
                    size: 24,
                  ),
                  title: Text(
                    "Lesson Title",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    "Date posted",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget peopleListView() {
    return ListView.builder(
        itemCount: course,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(
                  "S",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              title: Text("Student Name"),
            ),
          );
        });
  }
}
