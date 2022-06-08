class inputValidator {
  static validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'An E-mail is required to Login.';
    }
    if (!RegExp("^[a-z,A-Z,0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return 'Please a valid E-mail';
    }

    return null;
  }

  static validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please re-enter password';
    }
    return null;
  }

  static validateName(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter first name';
    }
    return null;
  }

  static validateLastName(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter last name';
    }
    return null;
  }

  static validateWeight(String? value) {
    if (value!.isEmpty) {
      return 'Enter valid weight in grams';
    }
    return null;
  }

  static validatePhone(String? value) {
    if (value!.isEmpty) {
      return 'Phone number is required to register.';
    }
    return null;
  }
}
