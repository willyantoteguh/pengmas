part of '../tugas_pwb/tugaspwb_bloc.dart';

abstract class TugasPwbState extends Equatable {}

class TugasPwbInitialState extends TugasPwbState {
  @override
  List<Object> get props => [];
}

class TugasPwbLoadingState extends TugasPwbState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class TugasPwbLoadedState extends TugasPwbState {
  List<Tugaspwb> tugaspwb;

  TugasPwbLoadedState({@required this.tugaspwb});

  @override
  List<Object> get props => [tugaspwb];
}

// ignore: must_be_immutable
class TugasPwbErrorState extends TugasPwbState {
  String message;

  TugasPwbErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
