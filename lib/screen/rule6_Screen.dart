import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:proapi/model/rulee6_model.dart';

class Rule6Screen extends StatefulWidget {
  const Rule6Screen({Key? key}) : super(key: key);

  @override
  State<Rule6Screen> createState() => _Rule6ScreenState();
}

class _Rule6ScreenState extends State<Rule6Screen> {
  List dataList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rule 6 Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            fetchDataFromRule6();
          },
          child: const Text('Fetch Data'),
        ),
      ),
    );
  }

  fetchDataFromRule6() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/json_responses/rule6.json');

    var responseData = jsonDecode(data);
    Rule6Model rule6dataresponse = Rule6Model.fromJson(responseData);

    log(rule6dataresponse.page.toString());
    dataList = rule6dataresponse.datamodel!;
    log(dataList.length.toString());
  }
}
