import 'package:quizigma/models/question.dart';
import 'package:random_string/random_string.dart';

// A class, which stores information about a quiz.
class Quiz {
  static final int minQuestions = 2;

  String _id;
  String _category;
  String _name;
  List<Question> _questions;
  DateTime _startDate;
  DateTime _endDate;
  int _timeInSeconds;
  int _numofQuestions;

  Quiz.namedconstructor(String id, String category, String name,
      int timeInSeconds, int numofQuestions) {
    _id = id;
    _category = category;
    _name = name;
    _timeInSeconds = timeInSeconds;
    _numofQuestions = numofQuestions;
  }

  Quiz(String category, String name, List<Question> questions,
      int timeInSeconds, int numofQuestions,
      [DateTime startDate, DateTime endDate, String id]) {
    if (questions.length < minQuestions) {
      throw new Exception();
    }

    if (id == null) {
      _id = randomAlphaNumeric(8);
    } else {
      _id = id;
    }

    if (startDate == null) {
      _startDate = DateTime.now();
    } else {
      _startDate = startDate;
    }

    if (endDate == null) {
      _endDate = DateTime.now().add(Duration(days: 30));
    } else {
      _endDate = endDate;
    }

    _category = category;
    _name = name;
    _questions = questions;
    _numofQuestions = questions.length;
    _timeInSeconds = timeInSeconds;
  }

  String get id {
    return _id;
  }

  String get category {
    return _category;
  }

  String get name {
    return _name;
  }

  List<Question> get questions {
    return _questions;
  }

  DateTime get startDate {
    return _startDate;
  }

  DateTime get endDate {
    return _endDate;
  }

  int get timeInSeconds {
    return _timeInSeconds;
  }

  int get numofQuestions {
    return _numofQuestions;
  }
}
