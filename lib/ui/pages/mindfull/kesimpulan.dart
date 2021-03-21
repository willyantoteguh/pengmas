part of '../pages.dart';

class KesimpulanPage extends StatefulWidget {
  @override
  _KesimpulanPageState createState() => _KesimpulanPageState();
}

class _KesimpulanPageState extends State<KesimpulanPage> {
  String kapan = '';
  String bagaimana = '';
  String fisik = '';
  String pikiran = '';
  String perasaan = '';
  String tindakan = '';
  String jam = '';
  String namaTugas;
  bool isDone = false;

  tugas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      namaTugas = prefs.getString("namaTugas");
      isDone = prefs.getBool(namaTugas + 'isDone');
    });
  }

  @override
  void initState() {
    super.initState();
    getDate();
    tugas();
  }

  void getDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      kapan = prefs.getString('kapan');
      jam = prefs.getString('jam');
      bagaimana = prefs.getString('bagaimana');
      fisik = prefs.getString('fisik');
      pikiran = prefs.getString('pikiran');
      perasaan = prefs.getString('perasaan');
      tindakan = prefs.getString('tindakan');
    });
  }

  void postKesimpulan() async {
    if (isDone == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Tugas Sudah Dikerjakan"),
            //content: Text("Tugas Sudah Dikerjakan"),
          );
        },
        barrierDismissible: true,
      );
      context.bloc<PageBloc>().add(GoToSuccessPage());
    } else {
      var url =
          'https://timkecilproject.com/pengmas/public/api/jawaban_mindfulnesses';

      SharedPreferences prefs = await SharedPreferences.getInstance();
      var id_pengguna = await prefs.getInt("id");
      var idTugas = await prefs.getInt("idTugas");
      String jawaban =
          "Pada tanggal $kapan\n Pukul $jam\n Saya mengalami $bagaimana\n Ketika itu, saya menyadari apa yang dirasakan oleh tubuh saya, yaitu $fisik\n Saya berfikir $pikiran\n Saya merasa $perasaan\n Dalam situasi seperti ini, biasanya saya melakukan $tindakan";
      print(id_pengguna);
      var data = {
        "id_tugas": idTugas.toString(),
        "id_pengguna": id_pengguna.toString(),
        "jawaban": jawaban
      };
      var response = await http.post(url, body: data);
      if (response.statusCode == 200) {
        setDone(namaTugas);
        context.bloc<PageBloc>().add(GoToTahukahPageOne());
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Error saat mengirim jawaban"),
              actions: <Widget>[
                FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  void route() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var idTugas = await prefs.getInt("idTugas");
    if (idTugas == 5) {
      context.bloc<PageBloc>().add(GoToSuaraPageOne());
    } else {
      postKesimpulan();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var idTugas = await prefs.getInt("idTugas");
          if (idTugas == 5) {
            context.bloc<PageBloc>().add(GoToTaskMindfullPage());
            return;
          } else {
            context.bloc<PageBloc>().add(GoToKalenderPageOne());
            return;
          }
        },
        child: Scaffold(
            body: Stack(children: <Widget>[
          Container(color: accentColor4),
          SafeArea(
              child: Container(
            color: Color(0xFFF6F7F9),
          )),
          ListView(children: <Widget>[
            SizedBox(height: 30),
            Column(
              children: <Widget>[
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 50, right: 50),
                  color: accentColor4,
                  child: RaisedButton(
                    child: Text('Lihat Rangkuman', style: blackTextFont),
                    // onPressed: ,
                    color: accentColor4,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          defaultMargin, 5, defaultMargin, 5),
                      child: Text('Pada tanggal $kapan',
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          style: blackTextFont.copyWith(fontSize: 14)),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          defaultMargin, 5, defaultMargin, 5),
                      child: Text('Pukul $jam',
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          style: blackTextFont.copyWith(fontSize: 14)),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          defaultMargin, 5, defaultMargin, 5),
                      child: Text('Saya mengalami $bagaimana',
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          style: blackTextFont.copyWith(fontSize: 14)),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          defaultMargin, 5, defaultMargin, 5),
                      child: Text(
                          'Ketika itu, saya menyadari apa yang dirasakan oleh tubuh saya, yaitu $fisik',
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          style: blackTextFont.copyWith(fontSize: 14)),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          defaultMargin, 5, defaultMargin, 5),
                      child: Text('Saya berfikir $pikiran',
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          style: blackTextFont.copyWith(fontSize: 14)),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          defaultMargin, 5, defaultMargin, 5),
                      child: Text('Saya merasa $perasaan',
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          style: blackTextFont.copyWith(fontSize: 14)),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          defaultMargin, 5, defaultMargin, 5),
                      child: Text(
                          'Dalam situasi seperti ini, biasanya saya melakukan $tindakan',
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          style: blackTextFont.copyWith(fontSize: 14)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 35),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 50, right: 50),
              child: RaisedButton(
                child: Text('Lanjut',
                    style: whiteTextFont.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w400)),
                color: mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () {
                  //context.bloc<PageBloc>().add(GoToTahukahPageOne());
                  route();
                },
              ),
            ),
            SizedBox(height: 50),
          ])
        ])));
  }
}
