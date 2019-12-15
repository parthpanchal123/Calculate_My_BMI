import 'package:bmi_demo/constants.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmi_res, this.bmi_res_txt, this.bmi_res_interpretation});

  final String bmi_res;
  final String bmi_res_txt;
  final String bmi_res_interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(15.0),
                child: Center(
                  child: Text('Your Results', style: results_style_txt),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: activeCardColour,
                cardChild: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        bmi_res,
                        style: final_result_txt_style,
                      ),
                      Text(
                        bmi_res_txt.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: bmi_txt_style,
                      ),
                      Text(
                        bmi_res_interpretation,
                        style: bmi_body_style,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottom_button(
              btn_title: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
