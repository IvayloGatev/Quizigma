class Question {
  final int _minAnswers = 2;
  final int _maxAnswers = 5;

  int _id;
  String _text;
  Map<int, String> _answers;
  int _correctAnswer;

  // Constructor for the class Question.
  Question(int id, String text, Map<int, String> answers, int correctAnswer) {
    if (answers.length < _minAnswers && answers.length > _maxAnswers) {
      throw new Exception();
    }
    if (!_answers.containsKey(_correctAnswer)) {
      throw new Exception();
    }

    _id = id;
    _text = text;
    _answers = answers;
    _correctAnswer = correctAnswer;
  }

  // Getters for the properties.
  int get id {
    return _id;
  }

  String get text {
    return _text;
  }

  Map<int, String> get answers {
    return _answers;
  }

  int get correctAnswer {
    return _correctAnswer;
  }
}
