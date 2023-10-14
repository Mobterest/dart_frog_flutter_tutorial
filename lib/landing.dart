import 'package:flutter/material.dart';
import 'package:tasklist_app/func.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> with Func {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(tag: "landing", child: Image.asset("assets/task.jpg")),
          const Text(
            "Organize your tasks",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              "List and organize your tasks to help you stay productive",
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await getLoginStatus(context);
              },
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20)),
              child: const Icon(Icons.keyboard_arrow_right))
        ],
      )),
    );
  }
}
