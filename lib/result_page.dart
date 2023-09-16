import 'package:calculator_app/home_page.dart';
import 'package:flutter/material.dart';
import 'design.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.result, this.resultMetric, this.recomendation});

  final result;
  final resultMetric;
  final recomendation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'BMI: ${result}',
            style: kMainButtonTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You are in ',
                style: kMainTextStyle,
              ),
              Text(
                '${resultMetric}',
                style: kMainButtonTextStyle,
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: [
              Text(
                'Recomendation',
                style: kMainTextStyle,
              ),
              Text(
                '${recomendation}',
                style: kMainBoldTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
