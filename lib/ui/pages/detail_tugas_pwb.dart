part of 'pages.dart';

// ignore: must_be_immutable
class DetailTugasPwb extends StatefulWidget {
  Tugaspwb tugaspwb;

  @override
  _DetailTugasPwbState createState() => _DetailTugasPwbState();
}

class _DetailTugasPwbState extends State<DetailTugasPwb> {
  TugasPwbBloc tugasPwbBloc;
  OnDetailTugasPwb state;

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("cat");
    tugasPwbBloc = BlocProvider.of<TugasPwbBloc>(context);
    tugasPwbBloc.add(FetchTugasPwbEvent(id));
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var column = Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20, left: 10),
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
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(height: 30),
              ClipPath(
                clipper: BestSellerClipper(),
                child: Container(
                  color: accentColor2,
                  padding:
                      EdgeInsets.only(left: 10, top: 5, right: 20, bottom: 5),
                  child: Text(
                    "Tenang".toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text("Kebahagiaan", style: kHeadingextStyle),
            ],
          ),
        ),
        SizedBox(height: 60),
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(0),
                  ),
                  color: accentColor4,
                ),
                child: BlocListener<TugasBloc, TugasState>(
                  listener: (context, state) {
                    if (state is TugasErrorState) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<TugasPwbBloc, TugasPwbState>(
                    // ignore: missing_return
                    builder: (context, state) {
                      if (state is TugasPwbInitialState) {
                        return buildLoading();
                      } else if (state is TugasPwbLoadingState) {
                        return buildLoading();
                      } else if (state is TugasPwbLoadedState) {
                        return buildTugaspwbList(state.tugaspwb);
                      } else if (state is TugasPwbErrorState) {
                        return buildErrorUi(state.message);
                      }
                    },
                  ),
                ),
                // child: Stack(
                //   children: <Widget>[
                //     Padding(
                //       padding: const EdgeInsets.all(30),
                //       child: Column(
                //         // crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[

                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ),
              Container(
                margin:
                    EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 20),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text("Daftar Latihan",
                      style: kTitleTextStyle.copyWith(color: Colors.white)),
                ),
              ),
              // SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToMainPage());

        return;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          Container(
            color: accentColor4,
          ),
          SafeArea(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF6F7F9),
                image: DecorationImage(
                  image: AssetImage("assets/images/newpack/9-SCENE.png"),
                  alignment: Alignment.topRight,
                ),
              ),
              child: column,
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildTugaspwbList(List<Tugaspwb> tugas) {
    return ListView.builder(
        itemCount: tugas.length,
        itemBuilder: (ctx, pos) {
          return FutureBuilder(
            future: getRiwayat(tugas[pos].nama),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              bool isDone = snapshot.data;
              return Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                          defaultMargin, 0, defaultMargin, 0),
                      child: Card(
                        color: isDone != true ? Colors.yellow : Colors.red,
                        child: ListTile(
                          trailing: Icon(MdiIcons.arrowRightDropCircle),
                          title: Text(tugas[pos].nama, style: blackTextFont),
                          /*subtitle: Text(tugas[pos].createdAt),*/
                          onTap: () {
                            print(tugas[pos].id);
                            /*context
                        .bloc<PageBloc>()
                        .add(GoToTaskPwbPage(tugas[pos], widget.category));
                    navigateToMateriDetailPage(context, materi[pos]);*/
                            if (tugas[pos].id == 1) {
                              context
                                  .bloc<PageBloc>()
                                  .add(GoToStudyChoicePage());
                            } else if (tugas[pos].id == 2) {
                              context.bloc<PageBloc>().add(GoToByDoingPage());
                            } else if (tugas[pos].id == 3) {
                              context
                                  .bloc<PageBloc>()
                                  .add(GoToPenjelasanTantangan3Page());
                            } else if (tugas[pos].id == 4) {
                              context
                                  .bloc<PageBloc>()
                                  .add(GoToPenjelasanTantangan4Page());
                            } else if (tugas[pos].id == 5) {
                              context
                                  .bloc<PageBloc>()
                                  .add(GoToTantangan5Page());
                            } else if (tugas[pos].id == 6) {
                              context.bloc<PageBloc>().add(GoToTugas6Page());
                              /*} else if (tugas[pos].id == 6) {
                      context.bloc<PageBloc>().add(GoToSyukurPage());*/
                            }
                          },
                        ),
                      )));
            },
          );
        });
  }
}

class BestSellerClipper6 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

// class DetailMateriPageNow extends StatefulWidget {
//   @override
//   _DetailMateriPageNowState createState() => _DetailMateriPageNowState();
// }

// class _DetailMateriPageNowState extends State<DetailMateriPageNow> {
//   MateriBloc materiBloc;

//   @override
//   void initState() {
//     super.initState();
//     materiBloc = BlocProvider.of<MateriBloc>(context);
//     materiBloc.add(FetchMateriEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Builder(
//         builder: (context) {
//           return Material(
//             child: Scaffold(
//               appBar: AppBar(
//                 title: Text("Cricket"),
//                 actions: <Widget>[
//                   IconButton(
//                     icon: Icon(Icons.refresh),
//                     onPressed: () {
//                       materiBloc.add(FetchMateriEvent());
//                     },
//                   ),
//                 ],
//               ),
//               body: Container(
//                 child: BlocListener<MateriBloc, MateriState>(
//                   listener: (context, state) {
//                     if (state is MateriErrorState) {
//                       Scaffold.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text(state.message),
//                         ),
//                       );
//                     }
//                   },
//                   child: BlocBuilder<MateriBloc, MateriState>(
//                     // ignore: missing_return
//                     builder: (context, state) {
//                       if (state is MateriInitialState) {
//                         return buildLoading();
//                       } else if (state is MateriLoadingState) {
//                         return buildLoading();
//                       } else if (state is MateriLoadedState) {
//                         return buildMateriList(state.materi);
//                       } else if (state is MateriErrorState) {
//                         return buildErrorUi(state.message);
//                       }
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

// Widget buildMateriList(List<Materi> materi) {
//   return ListView.builder(
//     itemCount: materi.length,
//     itemBuilder: (ctx, pos) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: InkWell(
//           child: ListTile(
//             title: Text(materi[pos].judul),
//             subtitle: Text(materi[pos].createdAt),
//           ),
//           onTap: () {
//             navigateToMateriDetailPage(context, materi[pos]);
//           },
//         ),
//       );
//     },
//   );
// }
/*
void navigateToMateriDetailPage(BuildContext context, Materi materi) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return TaskPage(
      materi: materi,
    );
  }));
}*/
