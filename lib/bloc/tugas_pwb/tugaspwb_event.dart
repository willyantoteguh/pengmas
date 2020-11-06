part of '../tugas_pwb/tugaspwb_bloc.dart';

abstract class TugasPwbEvent extends Equatable {}

class FetchTugasPwbEvent extends TugasPwbEvent {
  final int id;

  FetchTugasPwbEvent(this.id);
  @override
  List<Object> get props => null;

  //get id => id;
}
