import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/pages/Roadmap.dart';
import 'package:untitled/pages/app_drawer.dart';
import 'course_data.dart';

class CourseDirectory extends StatefulWidget {
  const CourseDirectory({super.key});

  @override
  State<CourseDirectory> createState() => CourseDirectoryState();
}

class CourseDirectoryState extends State<CourseDirectory> {
  @override
  Widget build(BuildContext context) {
    final courses = Provider.of<Courses>(context, listen: false).courses;

    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'My Courses',
          style: TextStyle(
            fontFamily: 'Cursive',
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: courses.isEmpty
          ? const Center(
        child: Text(
          'No courses available.',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white70,
            fontFamily: 'Cursive',
          ),
        ),
      )
          : ListView.builder(
        itemCount: courses.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            color: Colors.grey[900],
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.lightBlueAccent,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                course.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.lightBlueAccent,
                size: 16,
              ),
              onTap: () {
                // Navigation placeholder for future course detail page
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => RoadMapPage(course:course),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
