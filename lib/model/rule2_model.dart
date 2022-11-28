import 'dart:convert';

import 'package:flutter/material.dart';

class Rule2Model {
  String? city;
  List<dynamic>? streets;

  Rule2Model({
    this.city,
    this.streets,
  });

  factory Rule2Model.fromJson(Map<String, dynamic> json) {
    // var paresdstreeet = json['streat'];
    // List<String> stratsList = paresdstreeet.cast<String>();

    return Rule2Model(
      city: json['city'],
      streets: json['streets'].cast<dynamic>(),
      // streets: json["streets"] == null? [] : List<String>.from(json["streets"].map((x) => x))
      // streat: stratsList,
    );
  }
}


// 