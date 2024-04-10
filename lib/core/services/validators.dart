class Validators {
  static String? notEmptyValidator(String? value) {
    if (value?.isEmpty == true) {
      return 'This field is required';
    }
    return null;
  }

  static String? emailValidator(String? input) {
    if (input == null || input.isEmpty) return 'This field is required';
    return !RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[^\s@]+\.[a-zA-Z]+")
            .hasMatch(input)
        ? "Please enter a valid email address"
        : null;
  }

  static String? passwordValidator(String? value) {
    if (value?.isEmpty == true) {
      return 'This field is required';
    }
    if ((value?.length ?? 0) < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
