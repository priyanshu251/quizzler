import 'questions.dart';

class Quizbrain {
  int _number = 0;
  int _score = 0;
  List<Questions> _ql = [
    Questions(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Questions(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Questions(q: 'A slug\'s blood is green.', a: true),
    Questions(
        q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        a: false),
    Questions(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
    Questions(q: 'It is illegal to pee in the Ocean in Portugal.', a: true)
  ];

  void nextQues() {
    if (_number < _ql.length - 1) {
      _number++;
    }
  }

  bool isFinished() {
    if (_number >= _ql.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _number = 0;
  }

  void prev() {
    _number--;
  }

  int getScore() {
    return ++_score;
  }

  String getQues() {
    return _ql[_number].ques;
  }

  bool getAns() {
    return _ql[_number].ans;
  }
}

//     quiz 2
//
//     Question(
//         'No piece of square dry paper can be folded in half more than 7 times.',
//         false),
//     Question(
//         'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
//         true),
//     Question(
//         'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
//         false),
//     Question(
//         'The total surface area of two human lungs is approximately 70 square metres.',
//         true),
//     Question('Google was originally called \"Backrub\".', true),
//     Question(
//         'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
//         true),
//     Question(
//         'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
//         true),
