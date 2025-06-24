import 'package:flutter/material.dart';
import 'package:untitled/pages/app_drawer.dart';
import 'loading_screen.dart';
import 'websocket_service.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});
  final ws = WebSocketService();

  @override
  Widget build(BuildContext context) {
    final TextEditingController domainController = TextEditingController();
    final TextEditingController specificsController = TextEditingController();
    final TextEditingController depthController = TextEditingController();
    final TextEditingController levelController = TextEditingController();

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Learning Preferences',
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Cursive',
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                _buildCustomTextField('What Domain are you Interested in?', domainController),
                const SizedBox(height: 20),

                _buildCustomTextField('What specifics do you want to master?', specificsController),
                const SizedBox(height: 20),

                _buildCustomTextField('How much depth do you want?', depthController),
                const SizedBox(height: 20),

                _buildCustomTextField('At what level are you currently at?', levelController),
                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {
                    ws.sendJson({
                      'domain': domainController.text,
                      'specifics': specificsController.text,
                      'depth': depthController.text,
                      'level': levelController.text,
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Enter',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 Reusable Custom TextField Widget
  Widget _buildCustomTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
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
      ],
    );
  }
}
