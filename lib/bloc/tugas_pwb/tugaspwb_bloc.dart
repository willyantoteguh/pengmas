import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project1/models/models.dart';
import 'package:meta/meta.dart';
import 'package:project1/services/services.dart';

part 'tugaspwb_event.dart';
part 'tugaspwb_state.dart';

class TugasPwbBloc extends Bloc<TugasPwbEvent, TugasPwbState> {
  TugasPwbRepo tugaspwbrepo;
  TugasPwbBloc({@required this.tugaspwbrepo});

  @override
  TugasPwbState get initialState => TugasPwbInitialState();

  @override
  Stream<TugasPwbState> mapEventToState(
    TugasPwbEvent event,
  ) async* {
    if (event is FetchTugasPwbEvent) {
      yield TugasPwbLoadingState();
      try {
        List<Tugaspwb> tugaspwb = await tugaspwbrepo.getTugas(event.id);
        yield TugasPwbLoadedState(tugaspwb: tugaspwb);
      } catch (e) {
        TugasPwbErrorState(message: e.toString());
      }
    }
  }
}
