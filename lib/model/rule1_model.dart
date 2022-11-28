import 'dart:convert';

class Rule1Model {
  String? id;
  String? name;
  int? score;
  Rule1Model({
    this.id,
    this.name,
    this.score,
  });

  factory Rule1Model.fromJson(Map<String, dynamic> json) => Rule1Model(
        id: json['id'],
        name: json['name'],
        score: json['score'],
      );
}
