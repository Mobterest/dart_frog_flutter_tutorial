import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasklist_app/add_item.dart';
import 'package:tasklist_app/change_password.dart';
import 'package:tasklist_app/chat_room.dart';
import 'package:tasklist_app/custom_provider.dart';
import 'package:tasklist_app/landing.dart';
import 'package:tasklist_app/recipe.dart';
import 'package:tasklist_app/settings.dart';
import 'package:tasklist_app/signin.dart';
import 'package:tasklist_app/signup.dart';
import 'package:tasklist_app/viewlist.dart';

import 'file.dart';
import 'lists.dart';

CustomProvider customProvider = CustomProvider();

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => CustomProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasklist App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const Landing(),
        "/signin": (context) => const SignIn(),
        "/signup": (context) => const SignUp(),
        "/lists": (context) => const Lists(),
        ViewList.routeName: (context) => const ViewList(),
        AddItem.routeName: (context) => const AddItem(),
        "/recipe": (context) => const Recipe(),
        "/file": (context) => const FileUpload(),
        "/chat": (context) => const ChatRoom(),
        "/settings": (context) => const Settings(),
        "/changepass": (context) => const ChangePassword()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
