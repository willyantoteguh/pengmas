part of '../pages.dart';

class ProfilePage extends StatelessWidget {
  final String nama;
  final String email;
  const ProfilePage(this.nama, this.email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[100], Colors.blue[400]],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/person_pic.png"),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 40),
              Text(
                'NAME',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                "$nama",
                style: purpleTextFont.copyWith(fontSize: 25),
              ),
              SizedBox(height: 20),
              Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                "$email",
                style: purpleTextFont.copyWith(fontSize: 25),
              ),
              SizedBox(height: 40),
              RaisedButton(
                color: mainColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: whiteTextFont.copyWith(fontSize: 20),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                onPressed: () async {
                  delPref();
                  context.bloc<PageBloc>().add(GoToLoginPage());
                  /*Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return SignInPage();
                  }), ModalRoute.withName('/'));*/
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
