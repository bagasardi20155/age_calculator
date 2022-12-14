import 'package:flutter/material.dart';
import 'package:calculator_age/components/custom_card.dart';
import 'package:calculator_age/components/round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator_age/constanst.dart';
import 'package:calculator_age/calculator.dart';
import 'package:intl/intl.dart';
import 'package:age_calculator/age_calculator.dart';


class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final DateTime date = DateTime.now();
  
  DateTime? _dateTime1;
  DateTime? _dateTime2;
  DateDuration? _totalTime;

  String hari = '12';
  String bulan = '12';
  String tahun = '12';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Age Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: Color(0xFF1D1E33),
                    onPress: () {},
                    cardChild: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10.0),
                              margin: EdgeInsets.only(bottom: 15.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Date of Birth',
                                    style: labelTextStyle,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    (_dateTime1 != null)
                                    ? DateFormat('dd - MM - yyyy').format(_dateTime1!)
                                    : formatter.format(date),
                                    style: dateTextStyle,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                
                                Expanded(
                                  child: RoundIconButton(
                                    icon: FontAwesomeIcons.calendar,
                                    onPressed: () async {
                                      showDatePicker(
                                        context: context, 
                                        initialDate: date, 
                                        firstDate: DateTime(1500),
                                        lastDate: DateTime(2150),
                                      ).then((date){
                                        setState(() {
                                          _dateTime1 = date;
                                        });
                                      });
                                    },
                                  )
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ),
          ),
          
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: Color(0xFF1D1E33),
                    onPress: () {},
                    cardChild: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10.0),
                              margin: EdgeInsets.only(bottom: 15.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Age the Date of',
                                    style: labelTextStyle,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    (_dateTime2 != null)
                                    ? DateFormat('dd - MM - yyyy').format(_dateTime1!)
                                    : formatter.format(date),
                                    style: dateTextStyle,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                
                                Expanded(
                                  child: RoundIconButton(
                                    icon: FontAwesomeIcons.calendar,
                                    onPressed: () async {
                                      showDatePicker(
                                        context: context, 
                                        initialDate: date, 
                                        firstDate: DateTime(1500),
                                        lastDate: DateTime(2150),
                                      ).then((date){
                                        setState(() {
                                          _dateTime2 = date;
                                        });
                                      });
                                    },
                                  )
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 40.0, right: 40.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        height: 80.0,
                        color: Color(0xFFEB1555),
                        child: Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Calculator cal = Calculator(dateTime1: _dateTime1, dateTime2: _dateTime2,);

                        _totalTime = cal.result();
                        hari = _totalTime!.days.toString();
                        bulan = _totalTime!.months.toString();
                        tahun = _totalTime!.years.toString();
                      },
                    ),
                  )
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: Color(0xFF1D1E33),
                    onPress: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10.0),
                                margin: EdgeInsets.only(bottom: 15.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Your Age',
                                      style: numberTextStyle,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        tahun,
                                        style: numberTextStyle,
                                      ),
                                      const Text(
                                        'year(s)',
                                        style: resultTextStyle,
                                      ),
                                    ],
                                  ),
                                  
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        bulan,
                                        style: numberTextStyle,
                                      ),
                                      const Text(
                                        'month(s)',
                                        style: resultTextStyle,
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        hari,
                                        style: numberTextStyle,
                                      ),
                                      const Text(
                                        'day(s)',
                                        style: resultTextStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}