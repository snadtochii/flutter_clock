import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clock/clock/binary-time.dart';
import 'package:flutter_clock/clock/clock-column.dart';

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  BinaryTime _now = BinaryTime();

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _now = BinaryTime();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClockColumn(
            binaryInteger: _now.hourTens,
            title: 'H',
            color: Colors.blue,
            rows: 2,
          ),
          ClockColumn(
            binaryInteger: _now.hourOnes,
            title: 'h',
            color: Colors.lightBlue,
          ),
          ClockColumn(
            binaryInteger: _now.minuteTens,
            title: 'M',
            color: Colors.green,
            rows: 3,
          ),
          ClockColumn(
            binaryInteger: _now.minuteOnes,
            title: 'm',
            color: Colors.lightGreen,
          ),
          ClockColumn(
            binaryInteger: _now.secondTens,
            title: 'S',
            color: Colors.pink,
            rows: 3,
          ),
          ClockColumn(
            binaryInteger: _now.secondOnes,
            title: 's',
            color: Colors.pinkAccent,
          ),
        ],
      ),
    );
  }
}
