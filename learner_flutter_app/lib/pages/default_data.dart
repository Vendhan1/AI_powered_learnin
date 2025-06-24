import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'course_data.dart';

List<Course> defaultCourses=[
    Course(
      name: 'Flutter Basics',
      topics: [
        LessonTopic(
          name: 'Introduction',
          subtopics: [
            LessonSubtopic(
              name: 'What is Flutter?',
              content: ['Flutter is an open-source UI toolkit by Google.'],
            ),
            LessonSubtopic(
              name: 'Setup',
              content: ['Install Flutter SDK', 'Set up IDE', 'Run first app'],
            ),
          ],
        ),
        LessonTopic(
          name: 'Widgets',
          subtopics: [
            LessonSubtopic(
              name: 'Stateless Widgets',
              content: ['Build simple UI with Stateless widgets.'],
            ),
            LessonSubtopic(
              name: 'Stateful Widgets',
              content: ['Manage dynamic UI with Stateful widgets.'],
            ),
          ],
        ),
      ],
    ),
    Course(
      name: 'Python Basics',
      topics: [
        LessonTopic(
          name: 'Introduction',
          subtopics: [
            LessonSubtopic(
              name: 'What is Python?',
              content: ['Python is a popular programming language.'],
            ),
            LessonSubtopic(
              name: 'Installing Python',
              content: ['Install Python', 'Set up environment variables'],
            ),
          ],
        ),
        LessonTopic(
          name: 'Core Concepts',
          subtopics: [
            LessonSubtopic(
              name: 'Variables and Data Types',
              content: ['Learn about int, float, string, list, etc.'],
            ),
            LessonSubtopic(
              name: 'Control Structures',
              content: ['if-else', 'for loops', 'while loops'],
            ),
          ],
        ),
      ],
    ),
  ];


