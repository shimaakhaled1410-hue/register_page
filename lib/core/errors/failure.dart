
import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}
 // firebase server failure
class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromFirebaseAuth(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return ServerFailure('The email address is not valid.');
      case 'user-disabled':
        return ServerFailure('This account has been disabled.');
      case 'user-not-found':
        return ServerFailure('No account found with this email.');
      case 'wrong-password':
        return ServerFailure('The password is incorrect.');
      case 'email-already-in-use':
        return ServerFailure('This email address is already in use.');
      case 'weak-password':
        return ServerFailure('The password is too weak. Please choose a stronger one.');
      case 'operation-not-allowed':
        return ServerFailure('This sign-in method is not allowed.');
      default:
        return ServerFailure(e.message ?? 'An unexpected error occurred.');
    }
  }

  factory ServerFailure.fromException(Object e) {
    return ServerFailure(e.toString());
  }
}
