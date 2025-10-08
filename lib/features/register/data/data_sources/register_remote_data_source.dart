import 'package:firebase_auth/firebase_auth.dart';
import 'package:register_page/features/register/data/models/user_model.dart';

class RegisterRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  RegisterRemoteDataSource(this.firebaseAuth);

  Future<UserModel> register(String username, String email, String password) async {
    // create user via instance
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // update username
    await userCredential.user?.updateDisplayName(username);
    await userCredential.user?.reload();

    final updatedUser = firebaseAuth.currentUser!;

    return UserModel(
      username: updatedUser.displayName ?? username,
      email: updatedUser.email ?? email,
      password: password, 
    );
  }
}
