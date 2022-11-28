class Rule3Model {
  String? shapeNmaee;
  PropertyModel? prperyVal;

  Rule3Model({
    this.shapeNmaee,
    this.prperyVal,
  });

  factory Rule3Model.fromJson(Map<String, dynamic> json) {
    return Rule3Model(
      shapeNmaee:json['shape_name'],
      prperyVal: PropertyModel.fromjson(json['property']),
    );
  }
}

class PropertyModel {
  double? width;
  double? breadth;

  PropertyModel({
    this.width,
    this.breadth,
  });

  factory PropertyModel.fromjson(Map<String, dynamic> json) {
    return PropertyModel(
      width: json['width'],
      breadth: json['breadth'],
    );
  }
}
