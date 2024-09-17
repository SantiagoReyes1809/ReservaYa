import 'package:flutter/material.dart';
import 'package:gemini_ai_chat/gemini_ai_chat.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _geminiAIChat = GeminiAIChat(apiKey: 'YOUR_API_KEY');
  final _userInputController = TextEditingController();
  final _messages = <String>[];

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
                  title: Text(_messages[index]),
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
                    _geminiAIChat.sendMessage(userInput).then((response) {
                      setState(() {
                        _messages.add(response);
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