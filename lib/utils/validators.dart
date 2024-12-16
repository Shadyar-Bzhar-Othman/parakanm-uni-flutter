String? validateEmpty(value) {
  if (value == null || value.isEmpty) {
    return "This field is required";
  }

  return null;
}

String? validateName(name) {
  if (name == null || name.isEmpty) {
    return "Name is required";
  }

  return null;
}

String? validateEmail(email) {
  if (email == null || email.isEmpty) {
    return "Email is required";
  }

  if (!email.contains("@")) {
    return "Enter a valid email";
  }

  return null;
}

String? validatePassword(password) {
  if (password == null || password.isEmpty) {
    return "Password is required";
  }

  return null;
}
