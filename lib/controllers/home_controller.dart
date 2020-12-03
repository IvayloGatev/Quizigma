import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:quizigma/models/quizigma_user.dart';
import 'package:quizigma/services/firestore_database.dart';

class HomeController extends ControllerMVC {
  factory HomeController() {
    if (_this == null) {
      _this = HomeController._();
    }
    return _this;
  }

  static HomeController _this;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final database = FirestoreDatabase();

  HomeController._();

  // Get a QuzigmaUser object based on the current user.
  QuizigmaUser _getQuizigmaUser(User user) {
    return user != null ? QuizigmaUser(user.uid) : null;
  }

  // Change the authentication state of the current stream.
  Stream<QuizigmaUser> get user {
    return _auth.authStateChanges().map(_getQuizigmaUser);
  }

  // Sign in annonimously(for testing purpouses).
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _getQuizigmaUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email and password.
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _getQuizigmaUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and password.
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      database.updateUser(QuizigmaUser(user.uid));
      return _getQuizigmaUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out.
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
