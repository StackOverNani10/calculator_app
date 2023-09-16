import 'dart:math';

class Calculator{
  final height;
  final weight;

  double bmi = 0;

  Calculator(this.height, this.weight);

  String calculateBMI(){
    bmi = weight / pow(height/100, 2.0);
    return bmi.toStringAsFixed(2);
  }

  // Metodos que indique si esta en sobre peso y los consejos

}