class PasswordValidator {
  static final RegExp _upperCase = RegExp(r'[A-Z]');
  static final RegExp _digitNumber = RegExp(r'\d');
  static final RegExp _specialChar =
      RegExp(r"[!@#\$&*~%^()_\-+=\[\]{};:,.<>?/|]");

  static int calculateScore(String password) {
    int score = 0;
    if (password.isEmpty) return 0;
    if (password.length >= 8) score++;
    if (_upperCase.hasMatch(password)) score++;
    if (_digitNumber.hasMatch(password)) score++;
    if (_specialChar.hasMatch(password)) score++;
    return score.clamp(0, 4);
  }

 
  static bool isStrong(String password) => calculateScore(password) == 4;

  
  static String getLabel(String password) {
    switch (calculateScore(password)) {
      case 1:
        return 'Weak';
      case 2:
        return 'Fair';
      case 3:
        return 'Good';
      case 4:
        return 'Strong';
      default:
        return '';
    }
  }
}
