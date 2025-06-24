import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/pages/AI_Search.dart';
import 'package:untitled/pages/First_page.dart';
import 'package:untitled/pages/Manual_Search.dart';
import 'package:untitled/pages/Roadmap.dart';
import 'package:untitled/pages/app_drawer.dart';
import 'package:untitled/pages/course_data.dart';
import 'package:untitled/pages/courses_directory.dart';
import 'package:untitled/pages/loading_screen.dart';
import 'package:untitled/pages/websocket_service.dart';
import 'package:untitled/pages/login.dart';

void main() {
  runApp(MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_) => Courses())
    ], child:MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage() ,
    );
  }
}

