import 'package:flutter/material.dart';
import 'package:proapi/model/rule5_model.dart';
import 'package:proapi/screen/rule1_Screen.dart';
import 'package:proapi/screen/rule2_Screen.dart';
import 'package:proapi/screen/rule3_screen.dart';
import 'package:proapi/screen/rule4_screen.dart';
import 'package:proapi/screen/rule5_Screen.dart';
import 'package:proapi/screen/rule6_Screen.dart';

class ChoseResponeScreen extends StatefulWidget {
  ChoseResponeScreen({Key? key}) : super(key: key);

  @override
  State<ChoseResponeScreen> createState() => _ChoseResponeScreenState();
}

class _ChoseResponeScreenState extends State<ChoseResponeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chose Response Screen ')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RuleoneScreen()));
            },
            child: const Text(
              'Rule 1 ',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Rule2Screen()));
            },
            child: const Text(
              'Rule 2',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Rule3Screen()));
            },
            child: const Text(
              'Rule 3',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Rule4Screen()));
            },
            child: const Text(
              'Rule 4',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Rule5Screen()));
            },
            child: const Text(
              'Rule 5',
            ),
          ),
             ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context)
                   => Rule6Screen()));
            },
            child: const Text(
              'Rule 6',
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
