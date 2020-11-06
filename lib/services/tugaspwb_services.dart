part of 'services.dart';

abstract class TugasPwbRepo {
  Future<List<Tugaspwb>> getTugas(id);
}

class TugasPwbRepoImpl implements TugasPwbRepo {
  @override
  Future<List<Tugaspwb>> getTugas(id) async {
    var params = "tugas_kebahagiaans";

    var response = await http.get(Apiurl.apiURL + params);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Tugaspwb> tugaspwb = TugasPwb.fromJson(data).tugaspwb;
      return tugaspwb;
    } else {
      throw Exception();
    }
  }
}
