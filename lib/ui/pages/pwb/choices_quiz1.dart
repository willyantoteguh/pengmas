part of '../pages.dart';

class ChoicesQuiz1 extends StatefulWidget {
  Category category;

  @override
  _ChoicesQuiz1State createState() => _ChoicesQuiz1State();
}

class _ChoicesQuiz1State extends State<ChoicesQuiz1> {
  int _rgProgramming = -1;
  String _selectedValue;

  final List<RadioGroup> _programmingList = [
    RadioGroup(index: 1, text: "5. Bersih-bersih rumah."),
    RadioGroup(index: 2, text: "6. Bersih-bersih rumah."),
    RadioGroup(
        index: 3,
        text: "7. Melakukan hobi/kegiatan menyenangkan bersama keluarga."),
    RadioGroup(index: 4, text: "4. Beri contoh lain.."),
  ];

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
                        context
                            .bloc<PageBloc>()
                            .add(GoToDetailTugasPwb(widget.category));
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Latihan:\nTenang',
                      textAlign: TextAlign.center,
                      style: blackTextFont.copyWith(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ]),
          Container(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Kuadran II"),
                Text(
                    "Sangat penting dan sangat mendesak(lakukan segera sendiri)"),
                SizedBox(height: 25),
                _buildRadioButton(),
                SizedBox(height: 50),
                Text("Kamu memilih untuk :"),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    _selectedValue == null ? "Belum memilih" : _selectedValue,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Container(
                  height: 45,
                  width: 250,
                  margin: EdgeInsets.only(top: 30, bottom: 20),
                  child: RaisedButton(
                      elevation: 0,
                      color: mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(
                        "Lanjut",
                        style: whiteTextFont.copyWith(fontSize: 16),
                      ),
                      onPressed: () {
                        context.bloc<PageBloc>().add(GoToChoices2Page());
                      }),
                )),
              ],
            ),
          ),
        ]),
      ])),
    );
  }

  // widget radio
  Widget _buildRadioButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _programmingList
          .map((programming) => RadioListTile(
                title: Text(programming.text),
                value: programming.index,
                groupValue: _rgProgramming,
                controlAffinity: ListTileControlAffinity.trailing,
                dense: true,
                onChanged: (value) {
                  setState(() {
                    _rgProgramming = value;
                    _selectedValue = programming.text;
                  });
                },
              ))
          .toList(),
    );
  }
}

class RadioGroup1 {
  final int index1;
  final String text1;
  RadioGroup1({this.index1, this.text1});
}
