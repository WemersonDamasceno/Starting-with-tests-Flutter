class PersonModel {
  String? name;
  int? age;
  double? height;
  double? weight;

  PersonModel({
    this.name,
    this.age,
    this.height,
    this.weight,
  });

  double calculateIMC() {
    double imc = weight! / (height! * height!);
    return imc;
  }
}
