part of 'pages.dart';

// ignore: must_be_immutable
class DetailTugasMindfull extends StatefulWidget {
  @override
  _DetailTugasMindfullState createState() => _DetailTugasMindfullState();
}

class _DetailTugasMindfullState extends State<DetailTugasMindfull> {
  TugasBloc tugasBloc;
  OnDetailTugasMindfull state;

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("cat");
    tugasBloc = BlocProvider.of<TugasBloc>(context);
    tugasBloc.add(FetchTugasEvent(id));
  }

  @override
  void initState() {
    super.initState();
    getData();
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
          Container(
            color: accentColor4,
          ),
          SafeArea(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF6F7F9),
                image: DecorationImage(
                  image: AssetImage("assets/images/newpack/10-SCENE.png"),
                  alignment: Alignment.topRight,
                ),
              ),
              child: Column(
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
                        Text("Mindfullness", style: kHeadingextStyle),
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
                            child: BlocBuilder<TugasBloc, TugasState>(
                              // ignore: missing_return
                              builder: (context, state) {
                                if (state is TugasInitialState) {
                                  return buildLoading();
                                } else if (state is TugasLoadingState) {
                                  return buildLoading();
                                } else if (state is TugasLoadedState) {
                                  return buildTugasList(state.tugas);
                                } else if (state is TugasErrorState) {
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
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, 10, defaultMargin, 20),
                          /*child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text("Daftar Latihan",
                                style: kTitleTextStyle.copyWith(
                                    color: Colors.white)),
                          ),*/
                        ),
                        // SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildTugasList(List<TugasMindfull> tugas) {
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
                      onTap: () async {
                        saveTugas(tugas[pos].id, tugas[pos].nama);
                        context.bloc<PageBloc>().add(GoToTaskMindfullPage());
                        /*navigateToMateriDetailPage(context, materi[pos]);
                    if (widget.category.id == 1) {
                      context.bloc<PageBloc>().add(
                          GoToTaskMindfullPage(tugas[pos], widget.category));
                    } else {
                      context.bloc<PageBloc>().add(GoToByDoingPage());
                    }*/
                      },
                    ),
                  ),
                  // child: InkWell(
                  //   onTap: () {
                  //     navigateToMateriDetailPage(context, materi[pos]);
                  //   },
                  //   child: Row(
                  //     children: <Widget>[
                  //       Text(
                  //         number,
                  //         style: kHeadingextStyle.copyWith(
                  //           color: kTextColor.withOpacity(.15),
                  //           fontSize: 32,
                  //         ),
                  //       ),
                  //       SizedBox(width: 20),
                  //       RichText(
                  //         text: TextSpan(
                  //           children: [
                  //             TextSpan(
                  //               text: materi[pos].createdAt,
                  //               style: TextStyle(
                  //                 color: kTextColor.withOpacity(.5),
                  //                 fontSize: 18,
                  //               ),
                  //             ),
                  //             TextSpan(
                  //               text: materi[pos].judul,
                  //               style: kSubtitleTextSyule.copyWith(
                  //                 fontWeight: FontWeight.w600,
                  //                 height: 1.5,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Spacer(),
                  //       Container(
                  //         margin: EdgeInsets.only(left: 20),
                  //         height: 40,
                  //         width: 40,
                  //         decoration: BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           color: kGreenColor.withOpacity(isDone ? 1 : .5),
                  //         ),
                  //         child: Icon(Icons.play_arrow, color: Colors.white),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ),
              );
            },
          );
        });
  }
}

class BestSellerClipper4 extends CustomClipper<Path> {
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
