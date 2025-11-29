class AppValidators {
  // ---------------- Email ----------------
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }

    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$");
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  // ---------------- Password ----------------
  static String? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    }

    if (value.trim().length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }
  static String? defaultValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please fill out this field.';
    }
    return null;
  }
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }

    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters long';
    }

    final nameRegex = RegExp(r"^[a-zA-Z ]+$");
    if (!nameRegex.hasMatch(value.trim())) {
      return 'Name can contain only letters';
    }

    return null;
  }

  // ---------------- Confirm Password ----------------
  static String? confirmPassword(String? value, String password) {
    if (value == null || value.trim().isEmpty) {
      return 'Please confirm your password';
    }

    if (value.trim() != password.trim()) {
      return 'Passwords do not match';
    }

    return null;
  }
}
