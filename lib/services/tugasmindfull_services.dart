part of 'services.dart';

abstract class TugasRepo {
  Future<List<TugasMindfull>> getTugas(id);
}

class TugasRepoImpl implements TugasRepo {
  @override
  Future<List<TugasMindfull>> getTugas(id) async {
    var params = "tugas_mindfulnesses";

    var response = await http.get(Apiurl.apiURL + params);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<TugasMindfull> tugasmindfullness =
          TugasMindfullness.fromJson(data).tugas;
      return tugasmindfullness;
    } else {
      throw Exception();
    }
  }
}
