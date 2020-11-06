part of 'models.dart';

class TugasPwb {
  bool success;
  List<Tugaspwb> tugaspwb;
  String message;

  TugasPwb({this.success, this.tugaspwb, this.message});

  TugasPwb.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      tugaspwb = new List<Tugaspwb>();
      json['data'].forEach((v) {
        tugaspwb.add(new Tugaspwb.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> tugaspwb = new Map<String, dynamic>();
    tugaspwb['success'] = this.success;
    if (this.tugaspwb != null) {
      tugaspwb['data'] = this.tugaspwb.map((v) => v.toJson()).toList();
    }
    tugaspwb['message'] = this.message;
    return tugaspwb;
  }
}

class Tugaspwb {
  int id;
  String nama;
  String detail;
  String createdAt;
  String updatedAt;

  Tugaspwb({this.id, this.nama, this.detail, this.createdAt, this.updatedAt});

  Tugaspwb.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    detail = json['detail'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['detail'] = this.detail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
