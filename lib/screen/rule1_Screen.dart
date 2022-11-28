import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:proapi/model/rule1_model.dart';

class RuleoneScreen extends StatefulWidget {
  const RuleoneScreen({Key? key}) : super(key: key);

  @override
  State<RuleoneScreen> createState() => _RuleoneScreenState();
}

class _RuleoneScreenState extends State<RuleoneScreen> {
  Rule1Model? rule1;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rule 1 Screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                fetchDataFromJson();
              },
              child: const Text('Fetch Data'))
        ],
      ),
    );
  }

  fetchDataFromJson() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/json_responses/rule1.json');
    var jsonResponse = jsonDecode(data);
    rule1 = Rule1Model.fromJson(jsonResponse);
    log(rule1!.name.toString());
  }
}
