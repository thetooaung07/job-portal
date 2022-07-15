import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> authStateChanges() => auth.authStateChanges();
  Stream userChanges() => auth.userChanges();
}
