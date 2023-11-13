import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controllerWeight = TextEditingController();
  final TextEditingController controllerHight = TextEditingController();

  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora BMI"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            _buildTextFormField(controllerWeight, "Peso", "Introduzca el peso"),
            const Gap(15),
            _buildTextFormField(
                controllerHight, "Altura", "Introduzca la altura"),
            const Gap(10),
            FilledButton(
                onPressed: _calcularBMI, child: const Text("Calcular")),
            const Gap(10),
            Text("Tu BMI es: $result")
          ],
        ),
      ),
    );
  }

  _calcularBMI() {
    double hight = double.parse(
        controllerHight.text.isNotEmpty ? controllerHight.text : "0");
    double weight = double.parse(
        controllerWeight.text.isNotEmpty ? controllerWeight.text : "0");

    // Convertir altura a metros si está en centímetros
    if (hight > 3) {
      hight /= 100; // Convertir a metros si la altura está en centímetros
    }

    double bmi = weight / (hight * hight);

    setState(() {
      result = "${bmi.isNaN ? "Llena los formularios" : bmi}";
    });
  }

  Widget _buildTextFormField(
      TextEditingController controller, String labelText, String hintText) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+\.?[0-9]*'))
      ],
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        labelText: labelText,
        alignLabelWithHint: true,
      ),
    );
  }
}
