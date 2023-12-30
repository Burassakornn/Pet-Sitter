// ignore_for_file: unused_import, must_be_immutable
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'chat.dart';
import 'chat_model.dart';

class ChatDetailsScreen extends StatelessWidget {
  final int chatIndex; // Add a parameter to receive the index

  ChatDetailsScreen({required this.chatIndex}); // Constructor to initialize the index

  @override
  Widget build(BuildContext context) {
    var store1 = Provider.of<Store>(context); // Get the Store object

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatDeScreen(store1: store1, index: chatIndex), // Pass the chatIndex
    );
  }
}

class ChatMessage {
  final String text;
  final String sender;

  ChatMessage({required this.text, required this.sender});
}

class ChatDeScreen extends StatefulWidget {
  final Store store1; // Define the store1 variable
  final int index;   // Define the index variable

  ChatDeScreen({required this.store1, required this.index});

  @override
  State createState() => ChatDeScreenState(store1: store1, index: index);
}

class ChatDeScreenState extends State<ChatDeScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  final Store store1; // Define the store1 variable
  final int index;   // Define the index variable

  ChatDeScreenState({required this.store1, required this.index});

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      sender: "User", // You can replace this with the actual sender's name
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

 Widget _buildTextComposer() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
      children: <Widget>[
           IconButton(
          icon: Icon(Icons.attach_file_sharp), 
          onPressed: () {
          },
        ),
        IconButton(
          icon: Icon(Icons.camera_alt_rounded), 
          onPressed: () {
          },
        ),
        IconButton(
          icon: Icon(Icons.emoji_emotions_rounded), 
          onPressed: () {
          },
        ),
        Flexible(
          child: TextField(
            controller: _textController,
            onSubmitted: _handleSubmitted,
            decoration: InputDecoration(
              hintText: "Send a message",
              prefixIcon: Icon(Icons.mic), // Add your desired icon here
              // You can also customize the icon's appearance by wrapping it in an `Icon` widget
              // and applying custom styles.
              //prefixIcon: Icon(
              //  Icons.message,
              //  color: Colors.blue,
              //),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () => _handleSubmitted(_textController.text),
        ),
      ],
    ),
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.deepPurple,
      title: Text(
        store1.cats[index].name, // Use the cat's name as the title
        style: TextStyle(color: Colors.white),
      ),
    ),
    body: Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemCount: _messages.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildMessage(_messages[index]);
            },
          ),
        ),
        Divider(height: 1.0),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _buildTextComposer(),
        ),
      ],
    ),
  );
}
}

  Widget _buildMessage(ChatMessage message) {
    final bool isUserMessage = message.sender == "User";

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment:
        isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          isUserMessage
              ? Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 72, 2, 58),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(left: 40.0),
            child: Text(
              message.text,
              style: TextStyle(color: Colors.white),
            ),
          )
              : Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(right: 40.0),
            child: Text(
              message.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

