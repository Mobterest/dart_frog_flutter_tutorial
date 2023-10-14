import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'constant.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final TextEditingController messagecontroller = TextEditingController();
  List<Widget> messages = [];
  WebSocketChannel channel = WebSocketChannel.connect(Uri.parse(ws));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    channel.stream.listen((message) {
      getMessages(message, Colors.blue);
    });
  }

  @override
  void dispose() {
    channel.sink.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Room"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50, right: 20.0, left: 20.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: messages,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                      controller: messagecontroller,
                      decoration:
                          const InputDecoration(hintText: "Enter message"),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          getMessages(messagecontroller.text, Colors.black54);
                        });
                        channel.sink.add(messagecontroller.text);
                        messagecontroller.clear();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.blue,
                      ))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  getMessages(String message, Color clr) {
    setState(() {
      messages.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: clr, fontWeight: FontWeight.bold),
        ),
      ));
    });
  }
}
