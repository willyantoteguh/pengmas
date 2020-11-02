part of 'models.dart';

class TugasKomunikasi {
  bool success;
  List<Tugaskomunikasi> tugaskomunikasi;
  String message;

  TugasKomunikasi({this.success, this.tugaskomunikasi, this.message});

  TugasKomunikasi.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      tugaskomunikasi = new List<Tugaskomunikasi>();
      json['data'].forEach((v) {
        tugaskomunikasi.add(new Tugaskomunikasi.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> tugaskomunikasi = new Map<String, dynamic>();
    tugaskomunikasi['success'] = this.success;
    if (this.tugaskomunikasi != null) {
      tugaskomunikasi['tugaskomunikasi'] =
          this.tugaskomunikasi.map((v) => v.toJson()).toList();
    }
    tugaskomunikasi['message'] = this.message;
    return tugaskomunikasi;
  }
}

class Tugaskomunikasi {
  int id;
  String nama;
  String pertanyaan;
  String tantangan;
  String createdAt;
  String updatedAt;

  Tugaskomunikasi(
      {this.id,
      this.nama,
      this.pertanyaan,
      this.tantangan,
      this.createdAt,
      this.updatedAt});

  Tugaskomunikasi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    pertanyaan = json['pertanyaan'];
    tantangan = json['tantangan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['pertanyaan'] = this.pertanyaan;
    data['tantangan'] = this.tantangan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
