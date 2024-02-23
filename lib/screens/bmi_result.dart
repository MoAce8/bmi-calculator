import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  final int result;
  final bool gender;
  final double height;
  final int weight;
  final int age;

  String get resultPhrase{
    String text = '';

    if(result>=30)
      text = 'Obesity';
    else if(result>=25)
      text = 'Overweight';
    else if(result>=18)
      text = 'Normal';
    else if(result<18)
      text = 'Underweight';

    return text;
  }

  const BMIResultScreen({
    required this.result,
        required this.gender,
        required this.height,
        required this.weight,
        required this.age
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('BMI Calculator'),
          backgroundColor: Colors.cyan[800],
          centerTitle: true,
          elevation: 0,
        ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[900],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Result : $result',
                  style: TextStyle(
                    color: Colors.deepPurple[300],
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40,),
                Text(
                    'Healthiness : $resultPhrase',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple[100],
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30,),
                Text(
                  'Height : ${height.round()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Weight : $weight',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Age : $age',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
