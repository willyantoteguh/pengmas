import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project1/models/models.dart';
import 'package:meta/meta.dart';
import 'package:project1/services/services.dart';

part 'tugaskomunikasi_event.dart';
part 'tugaskomunikasi_state.dart';

class TugasKomunikasiBloc
    extends Bloc<TugaskomunikasiEvent, TugaskomunikasiState> {
  TugasKomunikasiRepo tugaskomunikasirepo;
  TugasKomunikasiBloc({@required this.tugaskomunikasirepo});

  @override
  TugaskomunikasiState get initialState => TugaskomunikasiInitialState();

  @override
  Stream<TugaskomunikasiState> mapEventToState(
    TugaskomunikasiEvent event,
  ) async* {
    if (event is FetchTugaskomunikasiEvent) {
      yield TugaskomunikasiLoadingState();
      try {
        List<Tugaskomunikasi> tugaskomunikasi =
            await tugaskomunikasirepo.getTugas(event.id);
        yield TugaskomunikasiLoadedState(tugaskomunikasi: tugaskomunikasi);
      } catch (e) {
        TugaskomunikasiErrorState(message: e.toString());
      }
    }
  }
}
