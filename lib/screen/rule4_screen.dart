import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:proapi/model/rule4_model.dart';

class Rule4Screen extends StatefulWidget {
  Rule4Screen({Key? key}) : super(key: key);

  @override
  State<Rule4Screen> createState() => _Rule4ScreenState();
}

class _Rule4ScreenState extends State<Rule4Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rule 4 Screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              fetch4RuleData();
            },
            child: const Text('Fetch Rule 4'),
          ),
        ],
      ),
    );
  }

  fetch4RuleData() async {
    String? data = await DefaultAssetBundle.of(context)
        .loadString('assets/json_responses/rule4.json');

    var resbonseBody = jsonDecode(data);

    Rule4Model rule4data = Rule4Model.fromJson(resbonseBody);

    log(rule4data.name.toString());
    log(rule4data.imageData!.first.id.toString());
  }
}
