import 'dart:convert';

class Rule5Model {
  List<Photos>? photosList;

  Rule5Model({
    this.photosList,
  });

  factory Rule5Model.fromJson(List<dynamic> json) {


    //  List<Photo> photos = new List<Photo>();
    // photos = parsedJson.map((i)=>Photo.fromJson(i)).toList();
    // 
    List<Photos> photolistData = json.map((e) => Photos.fromJson(e)).toList();
    return Rule5Model(
      photosList:photolistData, 
    );
  }
}

class Photos {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumnailUrl;

  Photos({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumnailUrl,
  });

  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumnailUrl: json['thumbnailUrl'],
    );
  }
}
