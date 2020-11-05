part of '../pages.dart';

class StudyCase extends StatefulWidget {
  @override
  _StudyCaseState createState() => _StudyCaseState();
}

class _StudyCaseState extends State<StudyCase> {
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
        Column(
          children: <Widget>[
            Container(
              height: 70,
              width: 200,
              margin: EdgeInsets.only(left: 20, right: 20, top: defaultMargin),
              child: RaisedButton(
                child: Text('Misi Pertama !',
                    style: whiteTextFont.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w400)),
                color: accentColor2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () {
                  // context.bloc<PageBloc>().add(GoToSuksesPage());
                },
              ),
            ),
            SizedBox(height: 25),
            Container(
                height: 400,
                width: (MediaQuery.of(context).size.width -
                    2 * defaultMargin -
                    24),
                margin:
                    EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(defaultMargin),
                  child: Text(
                      'Pada suatu hari, Ibu Tuti secara tidak sengaja melihat anaknya sedang duduk lesu sambil menunjukkan ekspresi sedih di mukanya setelah pembelajaran jarak jauh telah selesai. Anak Ibu melihat ke arah Ibu kemudian menghampiri sambil menangis. Anak Ibu Tuti bercerita panjang lebar kalau ia tidak memahami pelajaran yang diberikan oleh guru dan ketika hendak bertanya kepada guru, koneksinya buruk hingga akhir pembelajaran. Ia bercerita sambil sesenggukan menangis. ',
                      textAlign: TextAlign.justify,
                      style: whiteTextFont.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400)),
                )),
            SizedBox(height: 35),
            Align(
              alignment: Alignment.topCenter,
              child: FloatingActionButton(
                  elevation: 20,
                  backgroundColor: mainColor,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context.bloc<PageBloc>().add(GoToMainPage());
                  }),
            ),
            SizedBox(height: 100),
          ],
        ),
      ]),
    ]));
  }
}
