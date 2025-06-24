import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:untitled/pages/Roadmap.dart';
import 'package:untitled/pages/app_drawer.dart';
import 'websocket_service.dart';
import 'course_data.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late WebSocketService ws;
  late Course receivedMessage;
  late StreamSubscription streamSubscription;

  @override
  void initState() {
    super.initState();
    ws = WebSocketService();
    ServerResponse();
  }

  void ServerResponse() {
    streamSubscription = ws.stream.listen((message) {
      var decodedMessage = jsonDecode(message);
      print("Message received: $decodedMessage");
      receivedMessage = Course.fromJson(decodedMessage);

      Provider.of<Courses>(context, listen: false).addCourse(receivedMessage);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RoadMapPage(course: receivedMessage)),
        );
      });
    });
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    ws.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Colors.lightBlueAccent,
              strokeWidth: 5,
            ),
            SizedBox(height: 20),
            Text(
              "Loading...",
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 18,
                fontFamily: 'Cursive',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
