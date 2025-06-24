import 'package:flutter/material.dart';
import 'package:untitled/pages/app_drawer.dart';
import 'package:untitled/pages/course_data.dart';
import 'package:untitled/pages/lesson.dart';

class SubTopicsPage extends StatelessWidget {
  final LessonTopic lesson;
  const SubTopicsPage({
    super.key,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Generated Course',
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cursive',
          ),
        ),
        iconTheme: IconThemeData(color: Colors.lightBlueAccent),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: lesson.subtopics.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[900],
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.lightBlueAccent,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                lesson.subtopics[index].name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.lightBlueAccent,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LessonPage(
                      lesson: 'Example',
                      topic: lesson.subtopics[index].name,
                      content: lesson.subtopics[index].content,
                    ),
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
