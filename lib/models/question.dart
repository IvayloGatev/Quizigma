class Question {
  final int _minAnswers = 2;
  final int _maxAnswers = 5;

  String _id;
  String _text;
  List<String> _answers;
  int _correctAnswer;

  Question(String id, String text, List<String> answers, int correctAnswer) {
    if (answers.length < _minAnswers && answers.length > _maxAnswers) {
      throw new Exception();
    }

    _id = id;
    _text = text;
    _answers = answers;
    _correctAnswer = correctAnswer;
  }
}
