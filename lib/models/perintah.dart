part of 'models.dart';

class PerintahModel {
  bool success;
  List<Perintah> perintah;
  String message;

  PerintahModel({this.success, this.perintah, this.message});

  PerintahModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      perintah = new List<Perintah>();
      json['data'].forEach((v) {
        perintah.add(new Perintah.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.perintah != null) {
      data['data'] = this.perintah.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Perintah {
  int id;
  String pertanyaan;
  String detail;
  // ignore: non_constant_identifier_names
  int id_tugas;
  String createdAt;
  String updatedAt;

  Perintah(
      {this.id,
      this.pertanyaan,
      this.detail,
      // ignore: non_constant_identifier_names
      this.id_tugas,
      this.createdAt,
      this.updatedAt});

  Perintah.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pertanyaan = json['pertanyaan'];
    detail = json['detail'];
    id_tugas = json['id_tugas'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pertanyaan'] = this.pertanyaan;
    data['detail'] = this.detail;
    data['id_tugas'] = this.id_tugas;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;

    return data;
  }
}
