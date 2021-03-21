part of '../pages.dart';

class RateEmoji extends StatefulWidget {
  final List<String> mood = [
    "Gembira",
    "Antusias",
    "Tenang",
    "Santai",
    "Takut",
    "Stress",
    "Marah",
    "Gelisah",
    "Kewalahan"
  ];

  @override
  _RateEmojiState createState() => _RateEmojiState();
}

class _RateEmojiState extends State<RateEmoji> {
  var myFeedbackText = "SANGAT BURUK";
  var sliderValue = 0.0;
  IconData myFeedback = FontAwesomeIcons.sadTear;
  Color myFeedbackColor = mainColor;
  List<String> selectedMood = [];
  TextEditingController controller = TextEditingController();
  bool visible = false;
  String namaTugas;
  bool isDone = false;

  tugas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      namaTugas = prefs.getString("namaTugas");
      isDone = prefs.getBool(namaTugas + 'isDone');
    });
  }

  void initState() {
    super.initState();
    tugas();
  }

  void postRate() async {
    String jawaban = controller.text;
    setState(() {
      visible = true;
    });
    var url =
        'https://timkecilproject.com/pengmas/public/api/pengalaman_mindfulnesses';

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id_pengguna = await prefs.getInt("id");
    var idTugas = await prefs.getInt("idTugas");

    print(id_pengguna);
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
      setState(() {
        visible = false;
      });
      context.bloc<PageBloc>().add(GoToSuccessPage());
    } else if (jawaban == '' || selectedMood == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Error"),
            content: Text("Form Tidak Boleh Kosong"),
          );
        },
        barrierDismissible: true,
      );
      setState(() {
        visible = false;
      });
    } else {
      var data = {
        "id_tugas": idTugas.toString(),
        "id_pengguna": id_pengguna.toString(),
        "perasaan": myFeedbackText,
        "kesulitan": selectedMood.toString(),
        "pengalaman": jawaban
      };
      var response = await http.post(url, body: data);
      if (response.statusCode == 200) {
        setDone(namaTugas);
        setState(() {
          visible = false;
        });
        context.bloc<PageBloc>().add(GoToSuccessPage());
      } else {
        setState(() {
          visible = false;
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Isi Jawaban Terlebih Dahulu"),
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        int id = prefs.getInt("idTugas");
        if (id == 1) {
          context.bloc<PageBloc>().add(GoToSadarPageOne());
          return;
        } else if (id == 2) {
          context.bloc<PageBloc>().add(GoToMengamatiPageOne());
          return;
        } else if (id == 3) {
          context.bloc<PageBloc>().add(GoToPerspektifPageOne());
          return;
        } else if (id == 4) {
          context.bloc<PageBloc>().add(GoToKesimpulanPageOne());
          return;
        } else if (id == 5) {
          context.bloc<PageBloc>().add(GoToPerkataanPageOne());
          return;
        } else if (id == 6) {
          context.bloc<PageBloc>().add(GoToSyukurPage());
          return;
        }
      },
      child: Stack(children: <Widget>[
        Container(color: accentColor4),
        SafeArea(
            child: Container(
          color: Color(0xFFF6F7F9),
        )),
        ListView(
          children: <Widget>[
            Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20, left: 10),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Text(
                        "Bagaimana perasaanmu saat ini ? \n Geser tombol sesuai perasaanmu.",
                        textAlign: TextAlign.center,
                        style: purpleTextFont.copyWith(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            Stack(children: <Widget>[
              Container(
                color: accentColor4,
              ),
              SafeArea(
                  child: Container(
                color: Color(0xFFF6F7F9),
              )),
              Container(
                // color: Color(0xFFF6F7F9),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Align(
                        child: Material(
                          color: Colors.white,
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Color(0x802196F3),
                          child: Container(
                              width: 200.0,
                              height: 230.0,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                        child: Text(
                                      myFeedbackText,
                                      style: purpleTextFont.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                        child: Icon(
                                      myFeedback,
                                      color: myFeedbackColor,
                                      size: 60.0,
                                    )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Container(
                                      child: Slider(
                                        min: 0.0,
                                        max: 5.0,
                                        divisions: 5,
                                        value: sliderValue,
                                        activeColor: mainColor,
                                        inactiveColor: accentColor3,
                                        onChanged: (newValue) {
                                          setState(() {
                                            sliderValue = newValue;
                                            if (sliderValue >= 0.0 &&
                                                sliderValue <= 1.0) {
                                              myFeedback =
                                                  FontAwesomeIcons.sadTear;
                                              myFeedbackColor = Colors.red;
                                              myFeedbackText = "SANGAT BURUK";
                                            }
                                            if (sliderValue >= 1.1 &&
                                                sliderValue <= 2.0) {
                                              myFeedback =
                                                  FontAwesomeIcons.frown;
                                              myFeedbackColor = Colors.yellow;
                                              myFeedbackText = "BURUK";
                                            }
                                            if (sliderValue >= 2.1 &&
                                                sliderValue <= 3.0) {
                                              myFeedback = FontAwesomeIcons.meh;
                                              myFeedbackColor = Colors.amber;
                                              myFeedbackText = "BIASA";
                                            }
                                            if (sliderValue >= 3.1 &&
                                                sliderValue <= 4.0) {
                                              myFeedback =
                                                  FontAwesomeIcons.smile;
                                              myFeedbackColor = mainColor;
                                              myFeedbackText = "BAIK";
                                            }
                                            if (sliderValue >= 4.1 &&
                                                sliderValue <= 5.0) {
                                              myFeedback =
                                                  FontAwesomeIcons.laugh;
                                              myFeedbackColor = accentColor4;
                                              myFeedbackText = "SANGAT BAIK";
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                        child: Text(
                                      "Rating kamu: $sliderValue",
                                      style: TextStyle(
                                          color: mainColor,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600),
                                    )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Container(
                                        child: Align(
                                      alignment: Alignment.bottomCenter,
                                      /*child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    30.0)),
                                        color: mainColor,
                                        child: Text(
                                          'Kirim',
                                          style: TextStyle(
                                              color: Color(0xffffffff)),
                                        ),
                                        onPressed: () {},
                                      ),*/
                                    )),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Column(
                      children: <Widget>[
                        Text(
                          'Apa yang dirasakan setelah kegiatan ?',
                          textAlign: TextAlign.center,
                          style: purpleTextFont.copyWith(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: generateMoodWidget(context),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: Align(
                        child: Material(
                          color: Color(0xFFE4E4E4),
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Color(0x802196F3),
                          child: Container(
                            height: 250,
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
                                        hintText:
                                            'Ceritakan pengalamanmu disini',
                                      ),
                                      autofocus: false,
                                      /*onChanged: (isifield) {
                                        setState(() {});
                                      },*/
                                      controller: controller,
                                      //maxLength: 200,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  /*Container(
                                      margin: EdgeInsets.all(20),
                                      child: Text(controller.text,
                                          style: kTitleTextStyle))*/
                                ],
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Visibility(
                      visible: visible,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 50,
                      width: 200,
                      // margin: EdgeInsets.only(left: 50, right: 50),
                      child: RaisedButton(
                        child: Text('Selesai',
                            style: whiteTextFont.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                        color: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        onPressed: () {
                          //context.bloc<PageBloc>().add(GoToSuccessPage());
                          postRate();
                        },
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              )
            ])
          ],
        ),
      ]),
    );
  }

  List<Widget> generateMoodWidget(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 3;

    return widget.mood
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedMood.contains(e),
              onTap: () {
                onSelectMood(e);
              },
            ))
        .toList();
  }

  void onSelectMood(String mood) {
    if (selectedMood.contains(mood)) {
      setState(() {
        selectedMood.remove(mood);
      });
    } else {
      if (selectedMood.length < 2) {
        setState(() {
          selectedMood.add(mood);
        });
      }
    }
  }
}
