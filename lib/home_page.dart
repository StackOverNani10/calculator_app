import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator_app/icon_content.dart';
import 'package:flutter/material.dart';
import 'card_widget.dart';
import 'design.dart';
import 'calculator.dart';
import 'result_page.dart';

const Color kInactiveCardColor = Color(0XFF111328);
const Color kActiveCardColor = Color(0XFF1D1E33);

enum Gender { male, female }

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender? selectedGender;
  int height = 120;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: CardWidget(
                  color: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardContent: IconContent(
                    text: 'Male',
                    icon: FontAwesomeIcons.mars,
                  ),
                  action: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                child: CardWidget(
                  color: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardContent: IconContent(
                    text: 'Female',
                    icon: FontAwesomeIcons.venus,
                  ),
                  action: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                ),
              ),
            ],
          )),
          Expanded(
            child: CardWidget(
              color: kInactiveCardColor,
              cardContent: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kMainTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50.0,
                        ),
                      ),
                      Text(
                        ' cm',
                        style: kMainTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    min: 120.0,
                    max: 220.0,
                    value: height.toDouble(),
                    onChanged: (NewValue) {
                      setState(() {
                        height = NewValue.toInt();
                      });
                    },
                  ),
                ],
              ),
              action: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardWidget(
                    color: kInactiveCardColor,
                    cardContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kMainTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                fontSize: 50.0,
                              ),
                            ),
                            Text(
                              ' Kg',
                              style: kMainTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                    action: () {},
                  ),
                ),
                Expanded(
                  child: CardWidget(
                    color: kInactiveCardColor,
                    cardContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kMainTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              age.toString(),
                              style: TextStyle(
                                fontSize: 50.0,
                              ),
                            ),
                            Text(
                              ' Yrs',
                              style: kMainTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                    action: () {},
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              width: double.infinity,
              height: 60.0,
              color: Color(0XFFEB1555),
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: kMainButtonTextStyle,
                ),
              ),
            ),
            onTap: () {
              // Creamos un objeto de la clase calculator
              Calculator calc = Calculator(height, weight);
              String result = calc.calculateBMI();
              String resultMetric = ResultMetric(result);
              String recomendation = Recomendation(resultMetric);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    result: result,
                    resultMetric: resultMetric,
                    recomendation: recomendation,
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}

String ResultMetric(String result) {
  String metric;
  double resultBMI = double.parse(result);

  if (resultBMI <= 18.5) {
    metric = 'Underweight';
  } else if (resultBMI > 18.5 && resultBMI < 24.9) {
    metric = 'Normal weight';
  } else if (resultBMI > 25.0 && resultBMI < 29.9) {
    metric = 'Overweight';
  } else {
    metric = 'Obesity';
  }

  return metric;
}

String Recomendation(String metric) {
  String recomendation;

  if (metric == 'Underweight') {
    recomendation = 'Work on increasing your calorie intake in a healthy way.';
  } else if (metric == 'Normal weight') {
    recomendation = 'Maintain a balanced diet and an active lifestyle to sustain your health.';
  } else if (metric == 'Overweight') {
    recomendation = 'Consider making changes to your diet and increasing physical activity.';
  } else {
    recomendation = 'Make changes to your eating habits and increase physical activity.';
  }

  return recomendation;
}
