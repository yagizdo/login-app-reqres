import '../../utils/extensions/validation_query.dart';

class Validator {

  static String? email(String? value) {
    if (ValidationQuery.emailValidationQuery.hasMatch(value!)) {
      return null;
    }
    return "Lütfen geçerli bir e-posta adresi giriniz";
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Lütfen şifrenizi giriniz";
    } else if (value.length < 8) {
      return "Lütfen minimum 8 haneli şifre giriniz";
    }
    return null;
  }
}