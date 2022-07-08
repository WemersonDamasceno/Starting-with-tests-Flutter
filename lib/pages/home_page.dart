import 'package:flutter/material.dart';
import 'package:testes_unitarios_flutter/controllers/home_controller.dart';
import 'package:testes_unitarios_flutter/models/person_mode.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Calculate your IMC'),
            TextFormField(
              controller: homeController.inputHeightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height (cm)',
              ),
            ),
            TextFormField(
              controller: homeController.inputWeightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
              ),
            ),
            AnimatedBuilder(
              animation: homeController,
              builder: (context, child) {
                return Text(
                  'Your IMC is: ${homeController.getResultIMC}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          double height =
              double.parse(homeController.inputHeightController.text);
          double weight =
              double.parse(homeController.inputWeightController.text);
          homeController.personModel = PersonModel(
            age: 0,
            height: height,
            name: '',
            weight: weight,
          );
          homeController.calculateIMC();
        },
        child: const Icon(Icons.adb_sharp),
      ),
    );
  }
}
