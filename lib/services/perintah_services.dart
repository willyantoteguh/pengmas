part of 'services.dart';

abstract class PerintahRepo {
  Future<List<Perintah>> getPerintah(id);
}

class PerintahRepoImpl implements PerintahRepo {
  @override
  Future<List<Perintah>> getPerintah(id) async {
    var params = "pertanyaan_mindfulnesses?id_tugas=$id";

    var response = await http.get(Apiurl.apiURL + params);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Perintah> perintah = PerintahModel.fromJson(data).perintah;
      return perintah;
    } else {
      throw Exception();
    }
  }
}
