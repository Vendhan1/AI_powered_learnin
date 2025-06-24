import 'package:flutter/material.dart';
import 'default_data.dart';


class Courses with ChangeNotifier {
  final List<Course> _courses = [];
  final List<Course> defaultCourse= defaultCourses;


  List<Course> get courses => _courses;

  Courses() {
    _courses.addAll(_getDefaultCourse());
  }


  void addCourse(Course course) {
    _courses.add(course);
    notifyListeners(); // To update UI if necessary
  }
  Course getCourse(String name){
      //try{
        //return _courses.firstWhere((course)=> course.name == name);
      //}catch (e){
        //return null;
      //}
      return _courses.firstWhere((course)=> course.name == name);

  }
  List<Course> _getDefaultCourse(){
    return defaultCourses;
  }

// You can add more methods like remove, update, etc. if needed
}

class Course {
  final String name;
  final List<LessonTopic> topics;

  Course({required this.name, required this.topics});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      name: json['name'],
      topics: (json['topics'] as List)
          .map((e) => LessonTopic.fromJson(e))
          .toList(),
    );
  }
  @override
  String toString() {
    return 'Course(name: $name, topics: $topics)';
  }
}

class LessonTopic {
    final String name;
    final List<LessonSubtopic> subtopics;
    LessonTopic({
        required this.name,
        required this.subtopics
    });
    factory LessonTopic.fromJson(Map<String,dynamic> json){
      return LessonTopic(

          name: json['name'],
          subtopics: (json['subtopics'] as List)
              .map((e) => LessonSubtopic.fromJson(e))
              .toList(),

      );
    }
    @override
    String toString() {
      return 'LessonTopic(name: $name, subtopics: $subtopics)';
    }
}

class LessonSubtopic{
    final String name;
    final List<String> content;

    LessonSubtopic({
      required this.name,
      required this.content,
    });

    factory LessonSubtopic.fromJson(Map<String,dynamic> json){
      return LessonSubtopic(

          //name: json['name'],
          //content: List<String>.from(json['web_content']),

        name: json['name'] ?? '',
        content: json['content'] != null
            ? List<String>.from(json['content'])
            : [], // handle null safely



      );
    }

    @override
    String toString() {
      return 'LessonSubtopic(name: $name, content: $content )';
    }

}