import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:proapi/model/rule5_model.dart';

class Rule5Screen extends StatefulWidget {
  Rule5Screen({Key? key}) : super(key: key);

  @override
  State<Rule5Screen> createState() => _Rule5ScreenState();
}

class _Rule5ScreenState extends State<Rule5Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rule 5 Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            fetchDataFromRule5();
          },
          child: const Text('Rule 5 '),
        ),
      ),
    );
  }

  fetchDataFromRule5() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/json_responses/rule5.json');

    var responseData = jsonDecode(data);

    Rule5Model resData = Rule5Model.fromJson(responseData);

    log(resData.photosList![0].albumId.toString());
  }
}
