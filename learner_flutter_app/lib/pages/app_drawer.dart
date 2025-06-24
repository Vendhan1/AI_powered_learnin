import 'package:flutter/material.dart';


import 'Manual_Search.dart';
import 'courses_directory.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Text(
              'Learner',
              style: TextStyle(
                fontFamily: 'Cursive', // Matches your logo style
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.blueAccent),
            title: Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.book, color: Colors.blueAccent),
            title: Text('My Courses', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CourseDirectory()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.blueAccent),
            title: Text('Exit', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
