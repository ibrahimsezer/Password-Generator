import 'package:flutter/cupertino.dart';
import 'package:pass_gen/hash_password.dart';

class HashPasswordF extends HashPassword {
  static final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllermaster = TextEditingController();
  final TextEditingController _controllerurl = TextEditingController();
  bool passwordHashTrigger = false;
  bool visible = true;
  String controllers = "";

  String generate() {
    passwordHashTrigger = true;
    return controllers = _controllermaster.text + _controllerurl.text;
  }
}
