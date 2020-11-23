part of '../pages.dart';

class SyukurPage extends StatefulWidget {
  @override
  _SyukurPageState createState() => _SyukurPageState();
}

class _SyukurPageState extends State<SyukurPage> {
  bool viewVisible1 = true;
  bool viewVisible2 = true;
  bool viewVisible3 = true;
  bool viewVisible4 = true;

  TextEditingController dirisendiri = TextEditingController();
  TextEditingController keluarga = TextEditingController();
  TextEditingController pekerjaan = TextEditingController();

  void postSyukur() async {
    String jawaban1 = dirisendiri.text;
    String jawaban2 = keluarga.text;
    String jawaban3 = pekerjaan.text;
    var url =
        'https://timkecilproject.com/pengmas/public/api/jawaban_mindfulnesses';

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id_pengguna = await prefs.getInt("id");
    var idTugas = await prefs.getString("idTugas");
    print(id_pengguna);
    if (jawaban1 == '' || jawaban2 == '' || jawaban3 == '') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Error"),
            content: Text("Form Tidak Boleh Kosong"),
            actions: [
              CupertinoDialogAction(
                  isDefaultAction: true, child: new Text("Close"))
            ],
          );
        },
      );
    } else {
      var data = {
        "id_tugas": idTugas,
        "id_pengguna": id_pengguna.toString(),
        "jawaban1": jawaban1,
        "jawaban2": jawaban2,
        "jawaban3": jawaban3,
      };
      var response = await http.post(url, body: data);
      if (response.statusCode == 200) {
        context.bloc<PageBloc>().add(GoToRateEmojiPage());
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

  void showWidget1() {
    setState(() {
      viewVisible1 = true;
    });
  }

  void showWidget2() {
    setState(() {
      viewVisible2 = true;
    });
  }

  void showWidget3() {
    setState(() {
      viewVisible3 = true;
    });
  }

  void showWidget4() {
    setState(() {
      viewVisible4 = true;
    });
  }

  void hideWidget() {
    setState(() {
      viewVisible1 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToMainPage());

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
          Column(children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20, left: 10),
              height: 50,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        context.bloc<PageBloc>().add(GoToMainPage());
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Latihan:\nUngkapan Syukur',
                      textAlign: TextAlign.center,
                      style: blackTextFont.copyWith(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ]),
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Tenang'),
                onPressed: showWidget1,
                color: accentColor4,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              // RaisedButton(
              //   child: Text('Show Widget on Button Click'),
              //   onPressed: showWidget,
              //   color: Colors.pink,
              //   textColor: Colors.white,
              //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              // ),
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: viewVisible1,
                  child: Container(
                      // height: 200,
                      // width: 200,
                      // color: Colors.green,
                      margin: EdgeInsets.fromLTRB(30, 25, 30, 25),
                      child: Center(
                          child: GestureDetector(
                        onTap: hideWidget,
                        child: Text(
                            'Duduklah dengan tenang. Bawa kesadaran pada nafas Anda.\nRasakan aliran nafas pada seluruh tubuh Anda.',
                            textAlign: TextAlign.left,
                            style: blackTextFont.copyWith(fontSize: 20)),
                      )))),
            ],
          ),
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Diri Sendiri'),
                onPressed: showWidget2,
                color: accentColor4,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              // RaisedButton(
              //   child: Text('Show Widget on Button Click'),
              //   onPressed: showWidget,
              //   color: Colors.pink,
              //   textColor: Colors.white,
              //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              // ),
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: viewVisible2,
                  child: Container(
                      // height: 200,
                      // width: 200,
                      // color: Colors.green,
                      margin: EdgeInsets.fromLTRB(30, 25, 30, 25),
                      child: Center(
                          child: Text(
                              'Munculkan pikiran tentang diri Anda. Tanyakan pada diri Anda, apa hal yang Anda syukuri dari diri Anda?',
                              textAlign: TextAlign.justify,
                              style: blackTextFont.copyWith(fontSize: 20))))),
            ],
          ),
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Keluarga'),
                onPressed: showWidget3,
                color: accentColor4,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              // RaisedButton(
              //   child: Text('Show Widget on Button Click'),
              //   onPressed: showWidget,
              //   color: Colors.pink,
              //   textColor: Colors.white,
              //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              // ),
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: viewVisible3,
                  child: Container(
                      // height: 200,
                      // width: 200,
                      // color: Colors.green,
                      margin: EdgeInsets.fromLTRB(30, 25, 30, 25),
                      child: Center(
                          child: Text(
                              'Sekarang, hadirkan wajah-wajah anggota keluarga Anda. Tanyakan kembali, apa yang Anda syukuri dari keluarga Anda, sekecil apa pun?\nAnda dapat membayangkan peran Anda sebagai orang tua, maupun sebagai pasangan.',
                              textAlign: TextAlign.justify,
                              style: blackTextFont.copyWith(fontSize: 20))))),
            ],
          ),
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Pekerjaan'),
                onPressed: showWidget4,
                color: accentColor4,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              // RaisedButton(
              //   child: Text('Show Widget on Button Click'),
              //   onPressed: showWidget,
              //   color: Colors.pink,
              //   textColor: Colors.white,
              //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              // ),
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: viewVisible4,
                  child: Container(
                      // height: 200,
                      // width: 200,
                      // color: Colors.green,
                      margin: EdgeInsets.fromLTRB(30, 25, 30, 25),
                      child: Center(
                          child: Text(
                              'Bayangkan rutinitas pekerjaan Anda sehari-hari. Tarik nafas dalam, kemudian tanyakan kepada diri Anda,\napa hal yang dapat Anda syukuri dari pekerjaan Anda? Biarkan jawaban-jawaban itu muncul selayaknya gelembung sabun.',
                              textAlign: TextAlign.justify,
                              style: blackTextFont.copyWith(fontSize: 20))))),
            ],
          ),
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Catat'),
                onPressed: showWidget4,
                color: accentColor4,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              // RaisedButton(
              //   child: Text('Show Widget on Button Click'),
              //   onPressed: showWidget,
              //   color: Colors.pink,
              //   textColor: Colors.white,
              //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              // ),
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: viewVisible4,
                  child: Container(
                      // height: 200,
                      // width: 200,
                      // color: Colors.green,
                      margin: EdgeInsets.fromLTRB(30, 25, 30, 25),
                      child: Center(
                          child: Text(
                              'Apa yang anda syukuri dari diri anda sendiri?',
                              textAlign: TextAlign.center,
                              style: blackTextFont.copyWith(fontSize: 20))))),
            ],
          ),
          SizedBox(height: 25),
          Container(
            child: Align(
              child: Material(
                color: Color(0xFFE4E4E4),
                elevation: 10.0,
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Color(0x802196F3),
                child: Container(
                  height: 300,
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
                              hintText: 'isikan disini...',
                            ),
                            controller: dirisendiri,
                            //maxLength: 200,
                          ),
                        ),
                        /*Padding(
                            padding: const EdgeInsets.all(30),
                            child: Text(
                              controller.text,
                              style: kTitleTextStyle,
                            )),*/
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: viewVisible4,
                  child: Container(
                      // height: 200,
                      // width: 200,
                      // color: Colors.green,
                      margin: EdgeInsets.fromLTRB(30, 25, 30, 25),
                      child: Center(
                          child: Text(
                              'Apa yang anda syukuri dari keluarga anda?',
                              textAlign: TextAlign.center,
                              style: blackTextFont.copyWith(fontSize: 20))))),
            ],
          ),
          SizedBox(height: 25),
          Container(
            child: Align(
              child: Material(
                color: Color(0xFFE4E4E4),
                elevation: 10.0,
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Color(0x802196F3),
                child: Container(
                  height: 300,
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
                              hintText: 'Isikan disini...',
                            ),
                            controller: keluarga,
                            //maxLength: 200,
                          ),
                        ),
                        /*Padding(
                            padding: const EdgeInsets.all(30),
                            child: Text(
                              controller.text,
                              style: kTitleTextStyle,
                            )),*/
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: viewVisible4,
                  child: Container(
                      // height: 200,
                      // width: 200,
                      // color: Colors.green,
                      margin: EdgeInsets.fromLTRB(30, 25, 30, 25),
                      child: Center(
                          child: Text(
                              'Apa yang anda syukuri dari pekerjaan anda?',
                              textAlign: TextAlign.center,
                              style: blackTextFont.copyWith(fontSize: 20))))),
            ],
          ),
          SizedBox(height: 25),
          Container(
            child: Align(
              child: Material(
                color: Color(0xFFE4E4E4),
                elevation: 10.0,
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Color(0x802196F3),
                child: Container(
                  height: 300,
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
                              hintText: 'isikan disini...',
                            ),
                            controller: pekerjaan,
                            //maxLength: 200,
                          ),
                        ),
                        /*Padding(
                            padding: const EdgeInsets.all(30),
                            child: Text(
                              controller.text,
                              style: kTitleTextStyle,
                            )),*/
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
            margin: EdgeInsets.only(left: 50, right: 50),
            child: RaisedButton(
              child: Text('Lanjut',
                  style: whiteTextFont.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w400)),
              color: mainColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              onPressed: () {
                postSyukur();
                //context.bloc<PageBloc>().add(GoToKalenderPageOne());
              },
            ),
          ),
          SizedBox(height: 50),
        ])
      ])),
    );
  }
}
