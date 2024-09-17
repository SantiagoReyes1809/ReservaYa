import 'package:flutter/material.dart';
import 'package:gemini_ai_chat/gemini_ai.dart';
import 'package:gemini_ai_chat/models/gemini_ai_response.dart'; // Added import

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _geminiAI = GeminiAI(apiKey: 'YOUR_API_KEY'); // Create an instance of GeminiAI
  final _userInputController = TextEditingController();
  final _messages = <GeminiAIResponse>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Gemini AI'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
  title: Text(_messages[index].text), // Access the responseText property
);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _userInputController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                FloatingActionButton(
                  onPressed: () {
                    final userInput = _userInputController.text;
                    _geminiAI.generateTextFromQuery(userInput).then((response) {
                      setState(() {
                        _messages.add(response); // Add the GeminiAIResponse object to the list
                      });
                    });
                    _userInputController.clear();
                  },
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}