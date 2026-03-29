import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_market/core/errors/exceptions.dart';

class AuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('The account already exists for that email.');
      }
      else{
        log('FirebaseAuthException: ${e.code} - ${e.message}');
        throw CustomException('An error occurred while creating the user.');
      }
    } catch (e) {
      throw CustomException('An error occurred while creating the user.');
    }
  }
}
