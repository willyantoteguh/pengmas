part of 'services.dart';

abstract class TugasKomunikasiRepo {
  Future<List<Tugaskomunikasi>> getTugas(id);
}

class Urlkom {
  static String apiURL =
      "http://timkecilproject-com.preview-domain.com/pengmas/public/api/";
}

class TugasKomunikasiRepoImpl implements TugasKomunikasiRepo {
  @override
  Future<List<Tugaskomunikasi>> getTugas(id) async {
    var params = "tugas_komunikasis";

    var response = await http.get(Urlkom.apiURL + params);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Tugaskomunikasi> tugaskomunikasi =
          TugasKomunikasi.fromJson(data).tugaskomunikasi;
      return tugaskomunikasi;
    } else {
      throw Exception();
    }
  }
}
