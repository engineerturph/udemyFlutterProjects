import 'question.dart';

class QuizBrain {
  int _textNum = 0;

  List<Question> _questionsC = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true)
  ];

  String getQuestionText() {
    return _questionsC[_textNum].questionText;
  }

  bool getCorrectAnswer() {
    return _questionsC[_textNum].questionAnswer;
  }

  bool nextQuestion() {
    if (_textNum < _questionsC.length - 1) {
      _textNum++;
      return true;
    } else {
      return false;
    }
  }

  void resetQuestion() {
    _textNum = 0;
  }
}
