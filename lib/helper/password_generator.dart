import 'package:random_password_generator/random_password_generator.dart';

class PasswordGenerator {
  final bool _isWithLetters = true;
  final bool _isWithUppercase = true;
  final bool _isWithNumbers = true;
  final bool _isWithSpecial = true;
  final double _numberCharPassword = 12;
  String newPassword = "";
  String isOk = "";
  final password = RandomPasswordGenerator();

  String passwordgenerator() {
    newPassword = password.randomPassword(
      letters: _isWithLetters,
      numbers: _isWithNumbers,
      passwordLength: _numberCharPassword,
      specialChar: _isWithSpecial,
      uppercase: _isWithUppercase,
    );
    String newpass = newPassword;
    return newpass;
  }
}
