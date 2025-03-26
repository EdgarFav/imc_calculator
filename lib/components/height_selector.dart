import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  const HeightSelector({super.key});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  double height = 155; //Altura inicial

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text("ALTURA", style: TextStyles.bodyText),
            Text(
              "${height.toStringAsFixed(0)} cm",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Slider(
              value: height,
              onChanged: (newHeight) {
                setState(() {
                  height = newHeight;
                });
              },
              max: 220,
              min: 150,
              divisions: 70,
              activeColor: AppColors.primary,
              label: "${height.toStringAsFixed(0)} cm",
            ),
          ],
        ),
      ),
    );
  }
}
