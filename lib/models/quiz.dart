import 'package:quizigma/models/question.dart';
import 'package:random_string/random_string.dart';

class Quiz {
  static final int minQuestions = 5;

  String _id;
  String _category;
  String _name;
  List<Question> _questions;

  // Constructors for the class Quiz.
  Quiz(String category, String name, List<Question> questions, [String id]) {
    if (questions.length < minQuestions) {
      throw new Exception();
    }

    if (id == null) {
      _id = randomAlphaNumeric(8);
    } else {
      _id = id;
    }
    _category = category;
    _name = name;
    _questions = questions;
  }

  // Getters for the properties.
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
}
