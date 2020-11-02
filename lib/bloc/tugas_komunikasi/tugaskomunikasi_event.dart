part of '../tugas_komunikasi/tugaskomunikasi_bloc.dart';

abstract class TugaskomunikasiEvent extends Equatable {}

class FetchTugaskomunikasiEvent extends TugaskomunikasiEvent {
  final int id;

  FetchTugaskomunikasiEvent(this.id);
  //FetchTugasEvent(int id);
  @override
  List<Object> get props => null;

  //get id => id;
}
