part of 'shared.dart';

void saveTugas(id, nama) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt("idTugas", id);
  await prefs.setString("namaTugas", nama);
  //await prefs.setBool(nama + "isDone", true);
}

void setDone(nama) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(nama + "isDone", true);
}

getRiwayat(nama) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool done = prefs.getBool(nama + "isDone");
  return done;
}

void delPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("nama");
  prefs.remove("email");
  prefs.remove("id");
  prefs.remove("isSigningIn");
}
