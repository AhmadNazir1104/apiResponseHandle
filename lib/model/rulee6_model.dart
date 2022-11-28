import 'dart:convert';

class Rule6Model {
  int? page;
  int? perPage;
  int? totalPage;
  int? total;
  AutherModel? autherDetails;
  List<DataModel>? datamodel;
  Rule6Model(
      {this.page,
      this.perPage,
      this.totalPage,
      this.total,
      this.autherDetails,
      this.datamodel});

  factory Rule6Model.fromJson(Map<String, dynamic> parse) {
    List datalistModel = parse['data'] as List;

    List<DataModel>? dModelData =
        datalistModel.map((e) => DataModel.fromJson(e)).toList();
    return Rule6Model(
      page: parse['page'],
      perPage: parse['per_page'],
      total: parse['total'],
      totalPage: parse['total_pages'],
      autherDetails: AutherModel.fromJson(parse['author']),
      datamodel: dModelData,
    );
  }
}

class AutherModel {
  String? firstName;
  String? lastName;
  AutherModel({
    this.firstName,
    this.lastName,
  });
  factory AutherModel.fromJson(Map<String, dynamic> json) {
    return AutherModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }
}

class DataModel {
  int? id;
  String? firstName;
  String? lastName;
  String? avatar;
  List<ImagesDetailModel>? imageDetailsModel;
  DataModel({
    this.id,
    this.firstName,
    this.lastName,
    this.avatar,
    this.imageDetailsModel,
  });

  factory DataModel.fromJson(Map<String, dynamic> pase) {
    List imageList = pase['images'] as List;
    List<ImagesDetailModel> imagedetailList =
        imageList.map((e) => ImagesDetailModel.fromJson(e)).toList();
    return DataModel(
        id: pase['id'],
        firstName: pase['first_name'],
        lastName: pase['last_name'],
        avatar: pase['avatar'],
        imageDetailsModel: imagedetailList);
  }
}

class ImagesDetailModel {
  int? id;
  String? imageName;

  ImagesDetailModel({
    this.id,
    this.imageName,
  });

  factory ImagesDetailModel.fromJson(Map<String, dynamic> json) {
    return ImagesDetailModel(
      id: json['id'],
      imageName: 'imageName',
    );
  }
}
