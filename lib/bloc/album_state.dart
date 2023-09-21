part of 'album_bloc.dart';

@immutable
abstract class AlbumState {}

class AlbumInitialState extends AlbumState {}

class AlbumLoadingState extends AlbumState{}

class AlbumSuccessState extends AlbumState{
 final List<Album> list;
 AlbumSuccessState({required this.list});
}

class AlbumErrorState extends AlbumState{
final errorCode;
final errorMessage;
 AlbumErrorState({required this.errorCode,required this.errorMessage});
}