import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:proapi/model/rule3_model.dart';

class Rule3Screen extends StatefulWidget {
  Rule3Screen({Key? key}) : super(key: key);

  @override
  State<Rule3Screen> createState() => _Rule3ScreenState();
}

class _Rule3ScreenState extends State<Rule3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rule 3 Screen')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              fetchRule3Data();
            },
            child: const Text('Fetch Data From Function'),
          ),
        ],
      ),
    );
  }

  fetchRule3Data() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/json_responses/rule3.json');

    var responseData = jsonDecode(data);

    Rule3Model reponseVal = Rule3Model.fromJson(responseData);

    log(reponseVal.shapeNmaee.toString());

    log(reponseVal.prperyVal!.breadth.toString());
  }
}
