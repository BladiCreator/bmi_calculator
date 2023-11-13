import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    String result = "";

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TextFormField(
              controller: controller,
            ),
            FilledButton(onPressed: () {}, child: const Text("Calcular")),
            Text("Resultado: $result")
          ],
        ),
      ),
    );
  }

  _calcularBMI() {}
}
