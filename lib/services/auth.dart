import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oasis_app/models/user.dart';

class Authentication {
  Future<bool> register(String email, String password, String name) async {
    final userModel = UserModel(
      name: name,
      email: email,
      isAdmin: false,
    );

    try {
      final user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (user.user == null) {
        return false;
      } else {
        userModel.id = user.user!.uid;

        await FirebaseFirestore.instance
            .collection("users")
            .doc(user.user!.uid)
            .set(userModel.toMap());
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      final user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (user.user == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
