import 'package:flutter/material.dart';
import 'package:testes_unitarios_flutter/models/person_mode.dart';
import 'package:testes_unitarios_flutter/utils/enums_person.dart';

class HomeController extends ChangeNotifier {
  final inputHeightController = TextEditingController();
  final inputWeightController = TextEditingController();
  PersonModel personModel = PersonModel(age: 0, height: 0, name: '', weight: 0);
  double _resultIMC = 0.0;

  double averageScoreStudent = 0.0;
  double notaAP1 = 0.0;
  double notaAP2 = 0.0;
  double notaAP3 = 0.0;

  double get getResultIMC => _resultIMC;
  double get getAverageStudent =>
      double.parse(averageScoreStudent.toStringAsFixed(2));

  double calculateMedia() {
    averageScoreStudent = (notaAP1 + notaAP2 + notaAP3) / 3;
    return averageScoreStudent;
  }

  StatusStudent statusStudentInTests() {
    const _minimumGradeToDoAF = 4;
    const _averageScore = 7;

    if (averageScoreStudent >= _averageScore) {
      return StatusStudent.aproved;
    }
    if (averageScoreStudent >= _minimumGradeToDoAF &&
        averageScoreStudent < _averageScore) {
      return StatusStudent.willMakeRecovery;
    }
    return StatusStudent.reproved;
  }

  calculateIMC() {
    _resultIMC = double.parse(personModel.calculateIMC().toStringAsFixed(2));
    notifyListeners();
  }

  bool isOlder() {
    return personModel.age! >= 18;
  }
}
