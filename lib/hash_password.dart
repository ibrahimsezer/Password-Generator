import 'package:flutter/material.dart';
import 'package:hash_password/password_hasher.dart';

class HashPassword extends StatefulWidget {
  const HashPassword({Key? key}) : super(key: key);

  @override
  _HashPasswordState createState() => _HashPasswordState();
}

class _HashPasswordState extends State<HashPassword> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllermaster = TextEditingController();
  final TextEditingController _controllerurl = TextEditingController();
  final TextEditingController _confirmEmailController = TextEditingController();

  //Trigger for generating the hash code for the entered password
  bool password_hash_trigger = false;
  bool visible = true;
  String controllers = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Hash Password',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _controllermaster,
              decoration: const InputDecoration(
                hintText: 'Master Key',
              ),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              onFieldSubmitted: (value) {},
            ),
            TextFormField(
              controller: _controllerurl,
              decoration: const InputDecoration(
                hintText: 'URL',
              ),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              onFieldSubmitted: (value) {},
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.disabled,
              controller: _confirmEmailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              onFieldSubmitted: (value) {},
            ),
            Password_Hasher(
              algorithm_number: '512',
              Base64: true,
              Hex: true,
              controller: _controller,
              restrict: true,
              restrict_number: 12,
              child: TextFormField(
                controller: _controller,
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: '',
                ),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                onChanged: (String newValue) {
                  //Do something with the user input.
                },
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              child: const Text(
                'Submit',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                setState(() {
                  _controller.text = _controllermaster.text +
                      _controllerurl.text +
                      _confirmEmailController.text;
                  password_hash_trigger = true;
                });
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
