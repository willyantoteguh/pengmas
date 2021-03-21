part of '../pages.dart';

<<<<<<< HEAD
class Tugas6Page extends StatefulWidget {
  @override
  _Tugas6PageState createState() => _Tugas6PageState();
}

class _Tugas6PageState extends State<Tugas6Page> {
  CarouselSlider carouselSlider;
  // int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(color: accentColor4),
        SafeArea(
          child: Container(
            color: Color(0xFFF6F7F9),
          ),
        ),
        ListView(
          children: <Widget>[
            Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20, left: 10),
                height: 50,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        // onTap: () {
                        //   context
                        //       .bloc<PageBloc>()
                        //       .add(GoToDetailMateriPage(widget.category));
                        // },
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: defaultMargin),
                  child: Text('Tantangan',
                      textAlign: TextAlign.left,
                      style: blackTextFont.copyWith(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: defaultMargin),
                  child: Text(
                    'Coba renungkan dan tuliskan apa rencana hidup Anda dimasa depan',
                    textAlign: TextAlign.left,
                    style: blackTextFont.copyWith(fontSize: 16),
                  ),
                ),
              ),
            ]),
            SizedBox(height: 30),
            CarouselSlider(
              height: 250.0,

              // enlargeCenterPage: true,
              // autoPlay: true,
              // initialPage: 0,
              // pauseAutoPlayOnTouch: Duration(seconds: 10),
              // aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              // enableInfiniteScroll: true,
              // autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.5,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: true,
              enableInfiniteScroll: false,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              scrollDirection: Axis.horizontal,
              // onPageChanged: (index) {
              //   setState(() {
              //     _current = index;
              //   });
              // },
              items: [
                Container(
                  margin: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.61),
                          Colors.black.withOpacity(0)
                        ]),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1578242174372-e26b3681587f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToInputTujuanPage());
                        },
                        child: Text('Tujuan Jangka Pendek',
                            style: whiteTextFont.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Kurang dari 5 tahun kedepan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.61),
                          Colors.black.withOpacity(0)
                        ]),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1523735961257-ea378102c288?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToInputTujuanPage());
                        },
                        child: Text('Tujuan jangka menengah',
                            style: whiteTextFont.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          '5 sampai 10 tahun kedepan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.61),
                          Colors.black.withOpacity(0)
                        ]),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1591305097470-0fad344325aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToInputTujuanPage());
                        },
                        child: Text('Tujuan Jangka Panjang',
                            style: whiteTextFont.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Lebih dari 10 tahun',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     OutlineButton(
            //       onPressed: goToPrevious,
            //       child: Text("<"),
            //     ),
            //     OutlineButton(
            //       onPressed: goToNext,
            //       child: Text(">"),
            //     ),
            //   ],
            // ),
          ],
        )
      ],
    ));
  }

  // goToPrevious() {
  //   carouselSlider.previousPage(
  //       duration: Duration(milliseconds: 300), curve: Curves.ease);
  // }

  // goToNext() {
  //   carouselSlider.nextPage(
  //       duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  // }
=======
class InputTujuanPage extends StatefulWidget {
  @override
  _InputTujuanPageState createState() => _InputTujuanPageState();
}

class _InputTujuanPageState extends State<InputTujuanPage> {
  TextEditingController harmonis = TextEditingController();
  TextEditingController pekerjaan = TextEditingController();
  TextEditingController spiritualitas = TextEditingController();
  TextEditingController finansial = TextEditingController();
  TextEditingController kesehatan = TextEditingController();
  bool visible = false;

  void postKebahagiaan() async {
    setState(() {
      visible = true;
    });
    String j1 = harmonis.text;
    String j2 = pekerjaan.text;
    String j3 = spiritualitas.text;
    String j4 = finansial.text;
    String j5 = kesehatan.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var idTugas = prefs.getString('idTugas');
    var idUser = prefs.getInt("id");
    var tgs6 = prefs.getString("Tgs6");
    var jawaban =
        "$tgs6  -->  Keharmonisan Keluarga : $j1    Pekerjaan : $j2    Spiritualitas : $j3    Finansial : $j4    Kesehatan : $j5";
    if (j1 == '' || j2 == '' || j3 == '' || j4 == '' || j5 == '') {
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
      var url =
          'https://timkecilproject.com/pengmas/public/api/jawaban_kebahagiaans';
      var data = {
        "id_tugas": idTugas,
        "id_pengguna": idUser.toString(),
        "jawaban": jawaban
      };
      var response = await http.post(url, body: data);
      if (response.statusCode == 200) {
        setState(() {
          visible = false;
        });
        context.bloc<PageBloc>().add(GoToInti6Page());
      } else {
        setState(() {
          visible = false;
        });
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToNoteHomePage());

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
                  height: 50,
                  width: 250,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
                  decoration: BoxDecoration(
                    color: accentColor1,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Keharmonisan Keluarga :',
                        textAlign: TextAlign.center,
                        style: whiteTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  )),
              SizedBox(height: 0),
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
                                controller: harmonis,
                                //maxLength: 200,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  harmonis.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0),
              Container(
                  height: 50,
                  width: 250,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
                  decoration: BoxDecoration(
                    color: accentColor1,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Pekerjaan :',
                        textAlign: TextAlign.center,
                        style: whiteTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  )),
              SizedBox(height: 0),
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
                                controller: pekerjaan,
                                //maxLength: 200,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  pekerjaan.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0),
              Container(
                  height: 50,
                  width: 250,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
                  decoration: BoxDecoration(
                    color: accentColor1,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Spiritualitas : ',
                        textAlign: TextAlign.center,
                        style: whiteTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  )),
              SizedBox(height: 0),
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
                                controller: spiritualitas,
                                //maxLength: 200,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  spiritualitas.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0),
              Container(
                  height: 50,
                  width: 250,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
                  decoration: BoxDecoration(
                    color: accentColor1,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Kesehatan :',
                        textAlign: TextAlign.center,
                        style: whiteTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  )),
              SizedBox(height: 0),
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
                                controller: kesehatan,
                                //maxLength: 200,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  kesehatan.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0),
              Container(
                  height: 50,
                  width: 250,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
                  decoration: BoxDecoration(
                    color: accentColor1,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Finansial :',
                        textAlign: TextAlign.center,
                        style: whiteTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  )),
              SizedBox(height: 0),
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
                                controller: finansial,
                                //maxLength: 200,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  finansial.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Visibility(
                visible: visible,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              SizedBox(height: 20),
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
>>>>>>> b0082911699a1d56ea03b3adf6e4073e23f6c276
}
