// A class, which stores information about the quiz questions.
class Question {
  static final int minAnswers = 2;
  static final int maxAnswers = 5;

  int _id;
  String _text;
  List<String> _answers;
  int _correctAnswer;

  Question.namedconstructor(
      int id, String text, List<String> answers, int correctAnswer) {
    _id = id;
    _text = text;
    _answers = answers;
    _correctAnswer = correctAnswer;
  }

  Question(
    int id,
    String text,
    List<String> answers,
    int correctAnswer,
  ) {
    if (answers.length < minAnswers && answers.length > maxAnswers) {
      throw new Exception();
    }

    _id = id;
    _text = text;
    _answers = answers;
    _correctAnswer = correctAnswer;
  }

  int get id {
    return _id;
  }

  String get text {
    return _text;
  }

  List<String> get answers {
    return _answers;
  }

  int get correctAnswer {
    return _correctAnswer;
  }
}
