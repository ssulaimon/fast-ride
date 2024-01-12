class Validator {
  static String? emailValidator({required String text}) {
    if (text.isEmpty) {
      return "Email cannot be empty";
    } else if (!text.contains("@")) {
      return "Email domain is unknown";
    } else if (text.length < 3) {
      return "Email is too short";
    } else {
      return null;
    }
  }

  static String? passwordValidator({required String text}) {
    if (text.isEmpty) {
      return "Password is empty";
    } else if (text.length < 6) {
      return "Password is too short";
    } else {
      return null;
    }
  }

  static String? nameValidator({required String text}) {
    if (text.isEmpty) {
      return "Name is empty";
    } else if (text.length < 6) {
      return "FullName is too short";
    } else {
      return null;
    }
  }

  static String? phoneValidator({required String text}) {
    if (text.isEmpty) {
      return "Phone number is empty";
    } else if (text.length < 11) {
      return "Phone number is too short";
    } else {
      return null;
    }
  }

  static String? locationValidator({required String text}) {
    if (text.isEmpty) {
      return "Location cannot be empty";
    } else if (text.length < 3) {
      return "Location is invalid";
    } else {
      return null;
    }
  }
}
