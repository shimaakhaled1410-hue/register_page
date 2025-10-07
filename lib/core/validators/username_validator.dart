
class UsernameValidator {
  static final RegExp _usernameRegex = RegExp(
    r'^[a-zA-Z0-9](?!.*[_.]{2})[a-zA-Z0-9._]{2,19}$',
  );

 
  static bool isValid(String username) {
    return _usernameRegex.hasMatch(username);
  }

  static String? errorMessage(String username) {
    if (username.isEmpty) return null;
    if (!isValid(username)) {
      return 'Username must be 3–20 characters, no spaces, letters/numbers only.';
    }
    return null;
  }
}
