import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 35, left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_sharp),
                  iconSize: 30),
              const Text(
                "Login",
                style: TextStyle(fontSize: 40, color: Colors.blue),
              ),
              SizedBox(height: 20),
              const Text(
                "Login now to track all your expenses \nand income at a place!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 50),
              const Text(
                "Phone",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 40),
              TextField(
                onSubmitted: (String value) async {
                  await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Thanks!'),
                        content: Text(
                            'You typed "$value", which has length ${value.characters.length}.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                controller: _controller,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  border: OutlineInputBorder(),
                  helperText: 'you need remenber phone number',
                  helperStyle: TextStyle(color: Colors.blue),
                  hintText: "+998*********",
                ),
              ),
              const SizedBox(height: 100),
              Center(child: const LoginPage()),
            ],
          ),
        ),
      ),
    );
  }
}
