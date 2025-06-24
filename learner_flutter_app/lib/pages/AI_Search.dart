import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/pages/course_data.dart';
import 'Roadmap.dart';
import 'websocket_service.dart';
import 'app_drawer.dart';

class AiSearch extends StatelessWidget {
  const AiSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    final ws = WebSocketService();
    final courses=Provider.of<Courses>(context,listen:false).courses;
    final course=Provider.of<Courses>(context,listen:false).getCourse('Flutter Basics');
    
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'What are you interested in?',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Cursive', // You can use a better cursive font if imported
                  color: Colors.lightBlueAccent,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  hintText: 'Enter your response',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  ws.sendJson({'response': _controller.text});
                  Navigator.push(context,
                      MaterialPageRoute(
                      builder: (context) => RoadMapPage(course:course),
                  )
              );
              },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  'Enter',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
