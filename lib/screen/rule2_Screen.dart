import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:proapi/model/rule1_model.dart';

import '../model/rule2_model.dart';

class Rule2Screen extends StatefulWidget {
  Rule2Screen({Key? key}) : super(key: key);

  @override
  State<Rule2Screen> createState() => _Rule2ScreenState();
}

class _Rule2ScreenState extends State<Rule2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              fetchRuleTwoData();
            },
            child: const Text('Fetch Data'),
          ),
        ],
      ),
    );
  }

  fetchRuleTwoData() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/json_responses/rule2.json');

    var responsedata = jsonDecode(data);
    Rule2Model responseda = Rule2Model.fromJson(responsedata);

    log(responseda.streets![1].toString());
  }
}
