import 'dart:math';

import 'package:bmi_calculator/screens/bmi_result.dart';
import 'package:flutter/material.dart';

class BMIHomeScreen extends StatefulWidget {
  const BMIHomeScreen({super.key});

  @override
  State<BMIHomeScreen> createState() => _BMIHomeScreenState();
}

class _BMIHomeScreenState extends State<BMIHomeScreen> {
  bool male = true ;
  double height = 170;
  int age = 20;
  int weight = 65;


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
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    genderExpanded('MALE'),
                    const SizedBox(
                      width: 20,
                    ),
                    genderExpanded('FEMALE'),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[900],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white30,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Text(
                          'CM',
                          style: TextStyle(
                            color: Colors.white30,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: height,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                      min: 120,
                      max: 220,
                    ),
                  ],
                ),
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  ageWeightExpanded('AGE'),
                  const SizedBox(
                    width: 20,
                  ),
                  ageWeightExpanded('WEIGHT'),
                ],
              ),
            )),
            Container(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  double result = weight / pow(height / 100, 2);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BMIResultScreen(
                      height: height,
                      age: age,
                      gender: male,
                      result: result.round(),
                      weight: weight,
                    );
                  }));
                },
                height: MediaQuery.of(context).size.height/16,
                color: Colors.cyan[800],
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded genderExpanded(String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            male = type == 'MALE' ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (type == 'FEMALE' && !male)
                ? Colors.pink[400]
                : (type == 'MALE' && male)
                    ? Colors.blue[400]
                    : Colors.grey[900],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'MALE' ? Icons.male : Icons.female,
                size: 90,
                color: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                type,
                style: const TextStyle(
                  color: Colors.white30,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded ageWeightExpanded(String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[900],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type,
              style: const TextStyle(
                color: Colors.white30,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              type == 'AGE' ? '$age' : '$weight',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w900,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'AGE' ? 'age-' : 'weight-',
                  onPressed: () {
                    setState(() {
                      type == 'AGE' ? age-- : weight--;
                    });
                  },
                  mini: true,
                  backgroundColor: Colors.cyan[800],
                  child: Icon(
                    Icons.remove,
                  ),
                ),
                SizedBox(width: 6,),
                FloatingActionButton(
                  heroTag: type == 'AGE' ? 'age+' : 'weight+',
                  onPressed: () {
                    setState(() {
                      type == 'AGE' ? age++ : weight++;
                    });
                  },
                  mini: true,
                  backgroundColor: Colors.cyan[800],
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
