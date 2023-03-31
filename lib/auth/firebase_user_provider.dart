import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class LullabiesFirebaseUser {
  LullabiesFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

LullabiesFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<LullabiesFirebaseUser> lullabiesFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<LullabiesFirebaseUser>(
      (user) {
        currentUser = LullabiesFirebaseUser(user);
        return currentUser!;
      },
    );
