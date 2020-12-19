class QuizigmaUser {
  String _uid;

  int _score;
  int _bronzeMedals;
  int _silverMedals;
  int _goldMedals;

  QuizigmaUser(String uid) {
    _uid = uid;
    _score = 0;
    _bronzeMedals = 0;
    _silverMedals = 0;
    _goldMedals = 0;
  }

  QuizigmaUser.fromDatabase(String uid, int score, int bronzeMedals,
      int silverMedals, int goldMedals) {
    _uid = uid;
    _score = score;
    _bronzeMedals = bronzeMedals;
    _silverMedals = silverMedals;
    _goldMedals = goldMedals;
  }

  String get uid {
    return _uid;
  }

  int get score {
    return _score;
  }

  int get bronzeMedals {
    return _bronzeMedals;
  }

  int get silverMedals {
    return _silverMedals;
  }

  int get goldMedals {
    return _goldMedals;
  }
}
