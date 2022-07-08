class PersonModel {
  String name;
  int age;
  double height;
  double weight;

  PersonModel({
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
  });

  double calculateIMC() {
    double imc = weight / (height * height);
    return imc;
  }
}
