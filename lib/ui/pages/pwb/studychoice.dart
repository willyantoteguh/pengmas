part of '../pages.dart';

class StudyChoicePage extends StatefulWidget {
  @override
  _StudyChoicePageState createState() => _StudyChoicePageState();
}

class _StudyChoicePageState extends State<StudyChoicePage> {
  TextEditingController jwb1 = TextEditingController();
  TextEditingController jwb2 = TextEditingController();
  TextEditingController jwb3 = TextEditingController();
  TextEditingController jwb4 = TextEditingController();

  int idTugas;
  int idUser;
  String nama;
  @override
  void initState() {
    super.initState();
    getId();
  }

  void getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idTugas = prefs.getInt('idTugas');
      idUser = prefs.getInt("id");
      nama = prefs.getString('nama');
    });
  }

  void postKebahagiaan() async {
    String j1 = jwb1.text;
    String j2 = jwb2.text;
    String j3 = jwb3.text;
    String j4 = jwb4.text;
    var jawaban = "1.$j1  2.$j2  3.$j3  4.$j4";
    var url =
        'https://timkecilproject.com/pengmas/public/api/jawaban_kebahagiaans';
    var data = {
      "id_tugas": idTugas.toString(),
      "id_pengguna": idUser.toString(),
      "jawaban": jawaban
    };
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      context.bloc<PageBloc>().add(GoToStudyChoicePart2Page());
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToDetailTugasPwb());

        return;
      },
      child: Scaffold(
          body: Stack(children: <Widget>[
        Container(color: accentColor4),
        SafeArea(
            child: Container(
          color: Color(0xFFF6F7F9),
        )),
        ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                  height: 100,
                  width: 250,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
                  decoration: BoxDecoration(
                    color: accentColor1,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        'Jika kondisi dan situasi memungkinkan, saya ingin belajar tentang…',
                        textAlign: TextAlign.center,
                        style: whiteTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  )),
              SizedBox(height: 25),
              Container(
                child: Align(
                  child: Material(
                    color: Color(0xFFE4E4E4),
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      height: 100,
                      width: (MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          24),
                      child: ListView(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  10, defaultMargin, 10, defaultMargin),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Tulis jawabannya disini...',
                                ),
                                controller: jwb1,
                                //maxLength: 200,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  jwb1.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35),
              Container(
                child: Align(
                  child: Material(
                    color: Color(0xFFE4E4E4),
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      height: 100,
                      width: (MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          24),
                      child: ListView(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  10, defaultMargin, 10, defaultMargin),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Tulis jawabannya disini...',
                                ),
                                controller: jwb2,
                                //maxLength: 200,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  jwb2.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35),
              Container(
                child: Align(
                  child: Material(
                    color: Color(0xFFE4E4E4),
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      height: 100,
                      width: (MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          24),
                      child: ListView(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  10, defaultMargin, 10, defaultMargin),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Tulis jawabannya disini...',
                                ),
                                controller: jwb3,
                                //maxLength: 200,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  jwb3.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35),
              Container(
                child: Align(
                  child: Material(
                    color: Color(0xFFE4E4E4),
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      height: 100,
                      width: (MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          24),
                      child: ListView(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  10, defaultMargin, 10, defaultMargin),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Tulis jawabannya disini...',
                                ),
                                controller: jwb4,
                                //maxLength: 200,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  jwb4.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35),
              Container(
                height: 50,
                width: 150,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: RaisedButton(
                  child: Text('Lanjut',
                      style: whiteTextFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w400)),
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {
                    postKebahagiaan();
                    //context.bloc<PageBloc>().add(GoToStudyChoicePart2Page());
                  },
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ]),
      ])),
    );
  }
}
