part of '../tugas_komunikasi/tugaskomunikasi_bloc.dart';

abstract class TugaskomunikasiState extends Equatable {}

class TugaskomunikasiInitialState extends TugaskomunikasiState {
  @override
  List<Object> get props => [];
}

class TugaskomunikasiLoadingState extends TugaskomunikasiState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class TugaskomunikasiLoadedState extends TugaskomunikasiState {
  List<Tugaskomunikasi> tugaskomunikasi;

  TugaskomunikasiLoadedState({@required this.tugaskomunikasi});

  @override
  List<Object> get props => [tugaskomunikasi];
}

// ignore: must_be_immutable
class TugaskomunikasiErrorState extends TugaskomunikasiState {
  String message;

  TugaskomunikasiErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
