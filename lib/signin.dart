import 'package:flutter/material.dart';
import 'package:tasklist_app/func.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with Func {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Hero(
                  tag: "landing",
                  child: Image.asset(
                    "assets/task.jpg",
                    width: 300,
                  )),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(hintText: 'Enter username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordController.clear();
                        });
                      },
                      icon: const Icon(Icons.clear)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
              CheckboxListTile(
                value: rememberMe,
                onChanged: (bool? value) {
                  setState(() {
                    rememberMe = value!;
                  });
                },
                title: const Text("Remember Me"),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        getUserUsingBasic(usernameController.text,
                            passwordController.text, context, rememberMe);
                      }
                    },
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    child: const Text("Sign In")),
              ),
              const Spacer(),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                  child: const Text("Don't have an account? Sign Up!"))
            ],
          ),
        ),
      )),
    );
  }
}
