
class EmailValidator {
  static String? errorMessage(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (email.isEmpty) return 'Email cannot be empty';
    if (!regex.hasMatch(email)) return 'Enter a valid email';
    return null; 
  }
}
