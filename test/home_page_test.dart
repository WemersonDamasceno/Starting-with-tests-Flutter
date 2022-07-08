import 'package:flutter_test/flutter_test.dart';
import 'package:testes_unitarios_flutter/controllers/home_controller.dart';
import 'package:testes_unitarios_flutter/utils/enums_person.dart';

void main() {
  final homeController = HomeController();

  setUp(() {
    //person data
    homeController.personModel.age = 18;
    homeController.personModel.height = 1.80;
    homeController.personModel.weight = 80;
    homeController.personModel.name = 'João';

    //average test scores
    homeController.notaAP1 = 7;
    homeController.notaAP2 = 8;
    homeController.notaAP3 = 6;
  });

  group("isOlder | ", () {
    test("Age is bigger then 18", () {
      expect(homeController.isOlder(), true);
    });
  }); //testes media aritmética

  test("IMC is 24.69", () {
    homeController.calculateIMC();
    expect(homeController.getResultIMC, 24.69);
  });

  group("Student grades ", () {
    test("average score bigger then 7.00", () {
      homeController.calculateMedia();
      expect(homeController.getAverageStudent, 7.00);
    });

    test("will make recovery ", () {
      homeController.calculateMedia();
      expect(homeController.statusStudentInTests(), StatusStudent.aproved);
    });
  });
}
