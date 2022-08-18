import 'package:flutter/material.dart';
import 'hash_password.dart';
import 'helper/password_generator.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Passgen(),
    ),
  );
}

class Passgen extends StatefulWidget {
  const Passgen({Key? key}) : super(key: key);

  @override
  State<Passgen> createState() => _PassgenState();
}

class _PassgenState extends State<Passgen> {
  var a = PasswordGenerator();

  final Color _color = Colors.blue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Random Password Generator"),
          ),
          body: Center(
              child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  var d = a.passwordgenerator();
                  print(d);
                  setState(() {});
                },
                child: const Text(
                  "Password",
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.blue,
                      fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  a.newPassword,
                  style: TextStyle(color: _color, fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HashPassword()),
                  );
                },
                child: const Text("Hash"),
              ),
            ],
          )),
        ));
  }
}
