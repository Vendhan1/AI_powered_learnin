import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/pages/AI_Search.dart';
import 'package:untitled/pages/Manual_Search.dart';
import 'package:untitled/pages/app_drawer.dart';
import 'course_data.dart';
import 'websocket_service.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ws = WebSocketService();

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar( // ✅ You need this to see the drawer icon
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.lightBlueAccent),
        elevation: 0,
        title: Text(
          'Learner',
          style: TextStyle(
            fontFamily: 'Cursive',
            color: Colors.lightBlueAccent,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome There!!',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Cursive', // Add a custom cursive font for better match if needed
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Generate Your Course',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ws.sendJson({'Search_Type': 'Manual'});
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Text(
                      'Manual Search',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      ws.sendJson({'Search_Type': 'Ai'});
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AiSearch()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Text(
                      'AI Search',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
