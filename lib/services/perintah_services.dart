part of 'services.dart';

abstract class PerintahRepo {
  Future<List<Perintah>> getPerintah(id);
}

class PerintahRepoImpl implements PerintahRepo {
  @override
  Future<List<Perintah>> getPerintah(id) async {
    var url = "http://rsiaisyiyahnganjuk.com/pengmas/public/api/";
    var params = "pertanyaan_mindfulnesses?id_tugas=$id";

    var response = await http.get(Url.apiURL + params);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Perintah> perintah = PerintahModel.fromJson(data).perintah;
      return perintah;
    } else {
      throw Exception();
    }
  }
}
