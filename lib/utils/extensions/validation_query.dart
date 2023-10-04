class ValidationQuery {
  static final RegExp emailValidationQuery = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?@^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
}