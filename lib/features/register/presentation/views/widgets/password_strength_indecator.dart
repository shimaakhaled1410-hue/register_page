import 'package:flutter/material.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  final String password;

  static final RegExp _upperCase = RegExp(r'[A-Z]');
  static final RegExp _digitNumber = RegExp(r'\d');
  static final RegExp _specialChar = RegExp(
    r"[!@#\$&*~%^()_\-+=\[\]{};:,.<>?/|]",
  );

  const PasswordStrengthIndicator({super.key, required this.password});

  int _calculateScore(String password) {
    int score = 0;

    if (password.isEmpty) return 0;
    if (password.length >= 8) score++;
    if (_upperCase.hasMatch(password)) score++;
    if (_digitNumber.hasMatch(password)) score++;
    if (_specialChar.hasMatch(password)) score++;

    return score.clamp(0, 4);
  }

  String _getLabel(int score) {
    switch (score) {
      case 0:
        return '';
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

  @override
  Widget build(BuildContext context) {
    final score = _calculateScore(password);
    final color = Colors.green;
    final label = _getLabel(score);

    return AnimatedOpacity(
      opacity: password.isEmpty ? 0 : 1,
      duration: const Duration(milliseconds: 250),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6),
          Row(
            // 4
            children: List.generate(4, (index) {
              return Expanded(
                // 4 containers
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  height: 6,
                  decoration: BoxDecoration(
                    color: index < score ? color : Colors.grey[300],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
