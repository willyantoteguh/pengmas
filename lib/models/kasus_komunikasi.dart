part of 'models.dart';

class KasusKomunikasi {
  bool success;
  List<Kasuskomunikasi> kasuskomunikasi;
  String message;

  KasusKomunikasi({this.success, this.kasuskomunikasi, this.message});

  KasusKomunikasi.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      kasuskomunikasi = new List<Kasuskomunikasi>();
      json['data'].forEach((v) {
        kasuskomunikasi.add(new Kasuskomunikasi.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> kasuskomunikasi = new Map<String, dynamic>();
    kasuskomunikasi['success'] = this.success;
    if (this.kasuskomunikasi != null) {
      kasuskomunikasi['kasuskomunikasi'] =
          this.kasuskomunikasi.map((v) => v.toJson()).toList();
    }
    kasuskomunikasi['message'] = this.message;
    return kasuskomunikasi;
  }
}

class Kasuskomunikasi {
  int id;
  int idTugas;
  String kasus;
  String createdAt;
  String updatedAt;

  Kasuskomunikasi(
      {this.id, this.idTugas, this.kasus, this.createdAt, this.updatedAt});

  Kasuskomunikasi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idTugas = json['id_tugas'];
    kasus = json['kasus'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_tugas'] = this.idTugas;
    data['kasus'] = this.kasus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
