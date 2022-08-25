import 'package:flutter/material.dart';
import 'package:pass_gen/helper/password_generator.dart';
import 'package:pass_gen/hash_password.dart';

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
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HashPassword()));
      setState(() {
        _selectedIndex = index;
      });
      print(index);
    }
    if (index == 0) {
      setState(() {
        _selectedIndex = index;
      });
      print(index);
    }
  }

  var a = PasswordGenerator();

  final Color _color = Colors.blue;

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
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              var d = a.passwordgenerator();
                              print(d);
                              setState(() {});
                            },
                            child: const Text(
                              "Password",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            a.newPassword,
                            style: TextStyle(color: _color, fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.lock_reset_rounded), label: "Hash Generate")
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ));
  }
}
