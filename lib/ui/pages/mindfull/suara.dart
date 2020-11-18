part of '../pages.dart';

class SuaraPageOne extends StatefulWidget {
  @override
  _SuaraPageOneState createState() => _SuaraPageOneState();
}

class _SuaraPageOneState extends State<SuaraPageOne> {
  bool viewVisible1 = false;
  TextEditingController controller = TextEditingController();

  void postSuara() async {
    String jawaban = controller.text;
    var url =
        'https://timkecilproject.com/pengmas/public/api/jawaban_mindfulnesses';

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var id_pengguna = await prefs.getInt("id");
    var idTugas = await prefs.getString("idTugas");
    print(id_pengguna);
    if (jawaban == '') {
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
        "jawaban": jawaban
      };
      var response = await http.post(url, body: data);
      if (response.statusCode == 200) {
        context.bloc<PageBloc>().add(GoToPerkataanPageOne());
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

  void hideWidget() {
    setState(() {
      viewVisible1 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(color: accentColor4),
      SafeArea(
          child: Container(
        color: Color(0xFFF6F7F9),
      )),
      ListView(children: <Widget>[
        SizedBox(height: 30),
        Column(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(defaultMargin, 5, defaultMargin, 5),
                child: Text(
                    'Ya, sebetulnya pengalaman itu merupakan milik Anda.\nKali ini cobalah membaca seperti pengalaman tersebut dialami oleh teman Anda, bukan Anda. Sementara itu, kali ini Anda berperan sebagai seorang teman baik bagi teman Anda. ',
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.justify,
                    style: blackTextFont.copyWith(fontSize: 16)),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 30,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: RaisedButton(
                      child: Row(children: <Widget>[
                        Text('Baca Lagi',
                            style: whiteTextFont.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )
                      ]),
                      color: mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      onPressed: () {
                        context.bloc<PageBloc>().add(GoToMainPage());
                      },
                    ),
                  ),
                  Container(
                    height: 30,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: RaisedButton(
                      child: Row(children: <Widget>[
                        Text('Lanjut',
                            style: whiteTextFont.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ]),
                      color: mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      onPressed: () {
                        context.bloc<PageBloc>().add(GoToMainPage());
                      },
                    ),
                  ),
                ],
              ),

              // Row(
              //   children: <Widget>[

              //   ],
              // ),
            ],
          ),
          SizedBox(height: 35),
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Pikiran'),
                onPressed: showWidget1,
                color: accentColor4,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                            'Apa yang Anda pikirkan ketika teman Anda menceritakan pengalaman seperti itu kepada Anda?',
                            textAlign: TextAlign.left,
                            style: blackTextFont.copyWith(fontSize: 20)),
                      )))),
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
                              // hintText: 'Saya baru menyadari...',
                            ),
                            controller: controller,
                            maxLength: 200,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(30),
                            child: Text(
                              controller.text,
                              style: kTitleTextStyle,
                            )),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 50,
            margin: EdgeInsets.only(left: 50, right: 50),
            child: RaisedButton(
              child: Text('Selesai',
                  style: whiteTextFont.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w400)),
              color: mainColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              onPressed: () {
                //context.bloc<PageBloc>().add(GoToPerkataanPageOne());
                postSuara();
              },
            ),
          ),
        ])
      ])
    ]));
  }
}
