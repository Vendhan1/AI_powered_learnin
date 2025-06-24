import 'package:flutter/material.dart';
import 'package:untitled/pages/app_drawer.dart';

class LessonPage extends StatelessWidget {
  final String topic;
  final List<String> content;
  final String lesson;

  const LessonPage({
    Key? key,
    required this.lesson,
    required this.topic,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.black, // Black background
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          lesson,
          style: TextStyle(
            fontFamily: 'Cursive', // Matches your logo theme
            color: Colors.blueAccent,
            fontSize: 24,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.blueAccent),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                topic,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  fontFamily: 'Cursive', // Cursive style
                ),
              ),
              SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: content.length,
                separatorBuilder: (context, index) => SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[900], // Dark card for contrast
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        content[index],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // White text for readability
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
