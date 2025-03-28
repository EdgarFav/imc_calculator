import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weight;
  const ImcResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolBarResult(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    double fixedHeight = height / 100;
    double imcResult = weight / (fixedHeight * fixedHeight);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Tu resultado",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      getDescripcionByIMC(imcResult),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: getColorByIMC(imcResult),
                      ),
                    ),
                    Text(
                      imcResult.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 76,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        getDescriptionByIMC(imcResult),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.primary),
                ),
                child: Text("Finalizar", style: TextStyles.bodyText),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar toolBarResult() {
    return AppBar(
      title: Text("Resultado"),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }

  Color getColorByIMC(double imcResult) {
    return switch (imcResult) {
      < 18.5 => Colors.blue,
      < 24.9 => Colors.green,
      < 29.9 => Colors.orange,
      _ => Colors.red,
    };
  }

  String getDescripcionByIMC(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "IMC bajo",
      < 24.9 => "IMC normal",
      < 29.9 => "Sobrepeso",
      _ => "Obesidad",
    };
  }

  String getDescriptionByIMC(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "Tu peso esta por debajo del umbral de peso normal",
      < 24.9 => "Tu peso es normal, felicidades",
      < 29.9 => "Tienes sobrepeso, debes cuidar tu alimentación",
      _ => "Tienes obesidad, debes consultar a un especialista",
    };
  }
}
