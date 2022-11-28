class Rule4Model {
  int? id;
  String? name;
 List <ImagesModel>? imageData;

  Rule4Model({this.id, this.name,  this.imageData});

  factory Rule4Model.fromJson(Map<String, dynamic> json) {
    // var lit = json['imageData'] as List;
    // List<ImagesModel> listImagedata = lit.map((e) => ImagesModel.fromJson(e)).toList();
   

     var list = json['images'] as List;
    print(list.runtimeType);
    List<ImagesModel> imagesList = list.map((i) => ImagesModel.fromJson(i)).toList();
   
   
   
    return Rule4Model(
      id: json['id'],
      name: json['name'],
      imageData: imagesList
    );
  }
}

class ImagesModel {
  int? id;
  String? imageName;

  ImagesModel({
    this.id,
    this.imageName,
  });

  factory ImagesModel.fromJson(Map<String, dynamic> json) {
    return ImagesModel(
      id: json['id'],
      imageName: json['imageName'],
    );
  }
}
