import 'package:flutter/material.dart';
import 'package:random_password_generator/random_password_generator.dart';

void main() {
  runApp(const Passgen());
}

class Passgen extends StatefulWidget {
  const Passgen({Key? key}) : super(key: key);

  @override
  State<Passgen> createState() => _PassgenState();
}

class _PassgenState extends State<Passgen> {
  final bool _isWithLetters = true;
  final bool _isWithUppercase = true;
  final bool _isWithNumbers = true;
  final bool _isWithSpecial = true;
  final double _numberCharPassword = 12;
  String newPassword = '';
  String isOk = '';
  final Color _color = Colors.blue;
  final password = RandomPasswordGenerator();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Random Password Generator"),
          ),
          body: Center(
              child: Column(
            children: [
              FlatButton(
                onPressed: () {
                  newPassword = password.randomPassword(
                    letters: _isWithLetters,
                    numbers: _isWithNumbers,
                    passwordLength: _numberCharPassword,
                    specialChar: _isWithSpecial,
                    uppercase: _isWithUppercase,
                  );
                  setState(() {});
                },
                child: const Text(
                  "Password",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  newPassword,
                  style: TextStyle(color: _color, fontSize: 25),
                ),
              )
            ],
          )),
        ));
  }
}
