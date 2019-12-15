import 'dart:async';

import 'package:flutter/material.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_button_icon.dart';
import 'package:bmi_demo/bmi_brain.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Timer _timer;
  Color maleCardColor = inactiveCardColour;
  Color femaleCardColor = inactiveCardColour;
  int height = 170;
  int weight = 60;
  int age = 15;


  _InputPageState(){
    _timer = new Timer(const Duration(milliseconds: 400),(){
      showAlertDialog(BuildContext context) {

        // set up the button
        Widget okButton = FloatingActionButton(
          child: Icon(
            Icons.arrow_forward_ios,
          ) ,//Text("Ok Lets Go !"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        );

        // set up the AlertDialog
        AlertDialog alert = AlertDialog(
          backgroundColor: Color(0xFF1D1E33),
          elevation: 8.0,
          title: Text("Hello World :p"),
          content: Text("This is a fun 2 page app that calculates your BMI and is built using material design guidelines from Google and Cupertino by Apple. It doesnt do much , but was fun to </> it :) \n Built with ♥ using Flutter " ),
          actions: [
            okButton,
          ],
        );

        // show the dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }

      setState(() {

        showAlertDialog(context);


      });

    });
  }


  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          maleCardColor = femaleCardColor == inactiveCardColour
                              ? activeCardColour
                              : inactiveCardColour;
                          maleCardColor = activeCardColour;
                          femaleCardColor = inactiveCardColour;
                        });
                      },
                      colour: maleCardColor,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars, text: "MALE"),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          femaleCardColor = maleCardColor == inactiveCardColour
                              ? activeCardColour
                              : inactiveCardColour;
                          femaleCardColor = activeCardColour;
                          maleCardColor = inactiveCardColour;
                        });
                      },
                      colour: femaleCardColor,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus, text: "FEMALE"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: labelstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: number_style),
                        SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          'cm',
                          style: labelstyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Color(0xFFEB1555),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 16.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 28.0)),
                      child: Slider(
                        value: height.toDouble(), //current value of the slider
                        min: 120.0,
                        max: 220.0,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double new_value) {
                          setState(() {
                            height = new_value.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: labelstyle,
                          ),
                          Text(
                            weight.toString(),
                            style: number_style,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              roundButtonIcon(
                                icon: FontAwesomeIcons.minus,
                                operate: () {
                                  setState(() {
                                    weight -= 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              roundButtonIcon(
                                  icon: FontAwesomeIcons.plus,
                                  operate: () {
                                    setState(() {
                                      weight += 1;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: labelstyle,
                          ),
                          Text(
                            age.toString(),
                            style: number_style,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              roundButtonIcon(
                                icon: FontAwesomeIcons.minus,
                                operate: () {
                                  setState(() {
                                    age -= 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              roundButtonIcon(
                                  icon: FontAwesomeIcons.plus,
                                  operate: () {
                                    setState(() {
                                      age += 1;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottom_button(
              btn_title: 'CALCULATE',
              onTap: () {
                BMI_brain bm = BMI_brain(height: height, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmi_res: bm.calculateBMI(),
                              bmi_res_txt: bm.getResult(),
                              bmi_res_interpretation: bm.getInterpretation(),
                            )));
              },
            )
          ]),
    );
  }
}
