import 'package:quizigma/models/question.dart';
import 'package:random_string/random_string.dart';

class Quiz {
  static final int minQuestions = 5;

  String id;
  String category;
  String name;
  List<Question> _questions;
  DateTime _startDate;
  DateTime _endDate;

  Quiz.namedconstructor({this.id, this.category, this.name});

  // Constructors for the class Quiz.
  Quiz(String category, String name,
      [List<Question> questions,
      DateTime startDate,
      DateTime endDate,
      String id]) {
    if (questions.length < minQuestions) {
      throw new Exception();
    }

    if (id == null) {
      id = randomAlphaNumeric(8);
    } else {
      id = id;
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

    category = category;
    name = name;
    _questions = questions;
  }

  // Getters for the properties.

  List<Question> get questions {
    return _questions;
  }

  DateTime get startDate {
    return _startDate;
  }

  DateTime get endDate {
    return _endDate;
  }
}
