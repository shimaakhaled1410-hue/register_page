import 'package:firebase_auth/firebase_auth.dart';
import 'package:register_page/features/register/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.username,
    required super.email,
    required super.password,
  });

  factory UserModel.fromFirebase(User user, String password) {
    return UserModel(
      username: user.displayName ?? '',
      email: user.email ?? '',
      password: password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
    };
  }
}
