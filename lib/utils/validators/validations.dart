class EValidators {
  /// Text Validation
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    /// Regular expression for email validation
    final emailRegx = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegx.hasMatch(value)) {
      return 'Invalid email';
    }
    return null;
  }

  /// Validation of password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    /// Length of password validation
    if (value.length < 6) {
      return 'Password must be at least 6 character long';
    }

    /// Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must be contain at least one uppercase letter';
    }

    /// Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must be contain at least one number';
    }

    /// Check for special character
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must be contain at least one special character';
    }
    return null;
  }

  /// Validation of phone number
  static String? validatePhoneNo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    /// Regular expression for phone number
    final phoneRegx = RegExp(r'^\d{10}$');
    if (!phoneRegx.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required)';
    }

    return null;
  }
}
